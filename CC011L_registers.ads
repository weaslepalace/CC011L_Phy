--
-- CC011L_registers.ads
--

package CC011L_Registers is

   type IOCFG_Config is (
      RXFIFO_Above_Threshold,
      RXFIFO_Above_Threshold_Until_Drained,
      TXFIFO_Above_Threshold,
      TXFIFO_Full,
      RXFIFO_Overflow,
      TXFIFO_Underflow,
      Receiving_Packet,
      Good_Packet_Received,
      Clear_Channel,
      PLL_LOCK,
      Serial_Synchronous_Data_Output,
      Serial_Data_Output,
      Carrier_Sense,
      CRC_OK,
      PA_PD,
      Chip_Ready,
      Tristate,
      Clock_XOSC_Output,
   );

   for IOCFG_Config use (
      RXFIFO_Above_Threshold => 0,
      RXFIFO_Above_Threshold_Until_Drained => 1,
      TXFIFO_Above_Threshold => 2,
      TXFIFO_Full => 3,
      RXFIFO_Overflow => 4,
      TXFIFO_Underflow => 5,
      Receiving_Packet => 6,
      Good_Packet_Received => 7,
      Clear_Channel => 9,
      PLL_LOCK => 10,
      Serial_Clock => 11,
      Serial_Synchronous_Data_Output => 12,
      Serial_Data_Output => 13,
      Carrier_Sense => 14,
      CRC_OK => 15,
      PA_PD => 27,
      Chip_Ready => 41,
      Tristate => 46,
      Clock_XOSC_Output => 63
   );

   type IOCFG_Register is record
      Reserved : Constant Bit;
      Invert : Bit;
      Config : IOCFG_Config;
   end record;

   for IOCFG_Register use (
      Reserved at 0 range 7 .. 7;
      Invert at 0 range 6 .. 6;
      Config at 0 range 0 .. 5;
   );

   for IOCFG_Register'Size use 8;

   type RX_Attenuation is (
      RX_0dB,
      RX_6dB,
      RX_12dB,
      RX_18dB
   );

   for RX_Attenuation use (
      RX_0dB => 0,
      RX_6dB => 1,
      RX_12dB => 2,
      RX_18dB => 3
   ); 

   type FIFO_Threshold is (
      RX_4_TX_61,
      RX_8_TX_57,
      RX_12_TX_53,
      RX_16_TX_49,
      RX_20_TX_45,
      RX_24_TX_41,
      RX_28_TX_37,
      RX_32_TX_33,
      RX_36_TX_29,
      RX_40_TX_25,
      RX_44_TX_21,
      RX_48_TX_17,
      RX_52_TX_13,
      RX_56_TX_9,
      RX_60_TX_5,
      RX_64_TX_1
   );

   for FIFO_Threshold use (
      RX_4_TX_61 => 0,
      RX_8_TX_57 => 1,
      RX_12_TX_53 => 2,
      RX_16_TX_49 => 3,
      RX_20_TX_45 => 4,
      RX_24_TX_41 => 5,
      RX_28_TX_37 => 6,
      RX_32_TX_33 => 7,
      RX_36_TX_29 => 8,
      RX_40_TX_25 => 9,
      RX_44_TX_21 => 10,
      RX_48_TX_17 => 11,
      RX_52_TX_13 => 12,
      RX_56_TX_9 => 13,
      RX_60_TX_5 => 14,
      RX_64_TX_1 => 15
   );

   type FIFO_Threshold_Register is record
      Reserved : Constant Bit;
      Close_In_RX : RX_Attenuation;
      FIFO_THR : FIFO_Threshold;
   end record;

   for FIFO_Threshold_Register use (
      Reserved at 0 range 7..7;
      Close_In_RX at 0 range 4..5;
      FIFO_THR at 0 range 0..3;
   );
   
   for FIFO_Threshold_Register'Size use 8;

   type Address_Check_Type is (
      No_Address_Check,
      No_Broadcast,
      Address_0_Is_Broadcast,
      Address_0_And_255_Is_Broadcast
   );
   
   for Address_Check_Type use (
      No_Address_Check => 0,
      No_Broadcast => 1,
      Address_0_Is_Broadcast => 2,
      Address_0_And_255_Is_Broadcast => 3
   );   

   type Packet_Control_1_Register is record
      Reserved : Constant Integer range 0..15;
      CRC_Auto_Flush : Bit;
      Append_Status : Bit;
      Address_Check : Address_Check_Type; 
   end Packet_Control_1_Register;
   
   for Packet_Control_1_Register use (
      Reserved at 0 range 4 .. 7,
      CRC_Auto_Flush at range 3 .. 3
      Append_Status at 0 range 2 .. 2,
      Address_Check at 0 range 0 .. 1
   );

   for Packet_Control_1_Register'Size use 8;

   type Packet_Format_Type is (
      Use_FIFO,
      Synchronous_Serial,
      Test,
      Asynchronous_Serial
   );

   for Packet_Format_Type use (
      Use_FIFO => 0,
      Synchronous_Serial => 1,
      Test => 2,
      Asynchronous_Serial => 3
   );

   type Length_Config_Type is (
      Fixed,
      Variable,
      Infinite 
   );
   
   for Length_Config_Type use (
      Fixed => 0,
      Variable => 1,
      Infinite => 2
   );

   type Packet_Control_0_Regster is record
      Packet_Format : Packet_Format_Type;
      CRC_Enable : Bit;
      Length_Config : Length_Config_Type;
   end Packet_Control_0_Register;

   for Packat_Control_0_Register use (
      Packet_Format at 0 range 4 .. 5;
      CRC_Enable at 0 range 2 .. 2;
      Length_Config at 0 range 1 .. 0;
   );
   
   for Packet_Control_0_Register'Size use 8;
   
   type Demodulator_DC_Filter_Offset_Type is (
      Enable,
      Disable
   );

   for Demodulator_DC_Filter_Offset_Type use (
      Enable => 0,
      Disable => 1
   );

   type Modulation_Format_Type is (
      FSK_2,
      GFSK,
      OOK,
      FSK_4,
   );
   
   for Modulation_Format_Type use (
      FSK_2 => 0,
      GFSK => 1,
      OOK => 3,
      FSK_4 => 4
   );

   type Manchester_Enable is (
      Disable,
      Enable
   );
   
   for Manchester_Enable use (
      Disable => 0,
      Enable => 1
   );

   type Sync_Mode_Type is (
      None,
      Word_Bits_15_16,
      Word_Bits_16_16,
      Word_Bits_30_32
   );

   for Sync_Mode_Type is (
      None => 0,
      Word_Bits_15_16 => 1,
      Word_Bits_16_16 => 2,
      Word_Bits_30_32 => 3
   );

   type Preamble_Byte_Minimum_Type is (
      _2,
      _3,
      _4,
      _6,
      _8,
      _12,
      _16,
      _24
   );

   for Preamble_Byte_Minimum_Type use (
      _2 => 0,
      _3 => 1,
      _4 => 2,
      _6 => 3,
      _8 => 4,
      _12 => 5,
      _16 => 6,
      _24 => 7
   );

   type Modem_Configuration_Register is record
      Channel_Bandwidth_Exponent : Integer range 0..3;
      Channel_Bandwidth_Mantissa : Integer range 0..3;
      Data_Rate_Exponent : Integer range 0..15;
      Data_Rate_Mantissa : Integer range 0..255;
      Demodulator_DC_Filter_Offset : Demodulator_DC_Filter_Offset_Type;
      Modulation_Format : Modulation_Format_Type;
      Manchester_Enable : Manchester_Enable_Type;      
      Carrier_Sense_Sync : Bit;
      Sync_Mode : Sync_Mode_Type;
      Preamble_Byte_Minimun : Preamble_Byte_Minimum_Type;
      Channel_Spacing_Exponent : Integer range 0..3;
      Channel_Spacing_Mantissa : Integer range 0..255;
   end Modem_Configuration_Register;

   for Modem_Configuration_Register use (
      Channel_Bandwidth_Exponent at 4 range 6..7;
      Channel_Bandwidth_Mantissa at 4 range 4..5;
      Data_Rate_Exponent at 4 range 3..0;
      Data_Rate_Mantissa at 3 range 7..0;
      Demodulator_DC_Filter_Offset at 2 range 7..7;
      Modulation_Format at 2 range 4..6;
      Manchester_Enable at 2 range 3..3;
      Carrier_Sense_Sync at 2 range 2..2;
      Sync_Mode at 2 range 0..1;
      Preamble_Byte_Minimum at 1 range 4..6;
      Channel_Spacing_Exponent at 1 range 0..1;
      Channel_Spacing_Mantissa at 0 range 0..7;
   );

   for Modem_Configuration_Register'Size use 40;

   type Modem_Deviation_Register is record
      Deviation_Exponent : Integer range 0..7;
      Deviation_Mantissa : Integer range 0..7;
   end Modem_Configuration_Register;
   
   for Modem_Configuration_Register use (
      Deviation_Exponent at 0 range 4..6,
      Deviation_Mantissa at 0 range 0..2
   );

   for Modem_Configuration_Register'Size use 8;


   type CCA_Mode_Type is (
      Channel_Always_Clear,
      Channel_Clear_If_RSSI_Below_Threshold,
      Channel_Clear_Unless_Receiving,
      Channel_Clear_If_RSSI_Below_Thresold_Unless_Receiving
   );

   for CCA_Mode_Type use (
      Channel_Always_Clear => 0,
      Channel_Clear_If_RSSI_Below_Threshold => 1,
      Channel_Clear_Unless_Recieving => 2,
      Channel_Clear_If_RSSI_Below_Threshole_Unless_Receiving => 3
   );

   type RX_Off_Mode is (
      Next_State_Idle,
      Next_State_FSTXON,
      Next_State_TX,
      Stay_In_RX
   );

   for RX_Off_Mode use (
      Next_State_Idle => 0,
      Next_State_FSTXON => 1,
      Next_State_TX => 2,
      Stay_In_RX => 3
   );

   type TX_Off_Mode_Type is (
      Next_State_Idle,
      Next_State_FSTXON.
      Stay_In_TX,
      Next_State_RX
   );

   for TX_Off_Mode_Type use (
      Next_State_Idle => 0,
      Next_State_FSTXON => 1,
      Stay_In_TX => 2,
      Next_State_RX => 3
   );

   type Autocal_Mode_Type is (
      Never_Autocal,
      Autocal_On_Transition_To_RX_Or_TX,
      Autocal_On_Transition_To_Idle,
      Autocal_On_4th_Transition_To_Idle
   );
   
   for Autocal_Mode_Type use (
      Never_Autocal => 0,
      Autocal_On_Transition_To_RX_Or_TX => 1,
      Autocal_On Transition_To_Idle => 2,
      Autocal_On_4th_Transition_To_Idle => 3
   );

   type PO_Timeout_Type is (
      Timeout_After_1_Expiration,
      Timeout_After_16_Expirations,
      Timeout_After_64_Expirations,
      Timeout_After_256_Expirations
   );

   for PO_Timeout_Type use (
      Timeout_After_1_Expiration => 0,
      Timeout_After_16_Expirations => 1,
      Timeout_After_64_Expirations => 2,
      Timeout_After_256_Expirations => 3
   );

   type Main_Radio_Control_State_Machine_Register is record
      RX_Time_RSSI : Bit;
      CCA_Mode : CCA_Mode_Type;
      RX_Off_Mode : RX_Off_Mode_Type;
      TX_Off_Mode : TX_Off_Mode_Type;
      Autocal_Mode : Autocal_Mode_Type;
      PO_Timeout : PO_Timeout_Type;
      XOSC_Force_On : Bit;
   end Main_Radio_Control_State_Machine_Register;

   for Main_Radio_Control_State_Machine_Register use (
      RX_Time_RSSI at 2 range 4..4,
      CCA_Mode at 1 range 4..5,
      RX_Off_Mode at 1 range 2..3,
      TX_Off_Mode at 1 range 0..1,
      Autocal_Mode at 0 range 4..5,
      PO_Timeout at 0 range 2..3,
      XOSC_Force_On at 0 range 0..0
   );

   for Main_Radio_Control_State_Mancine_Regieter'Size use 24;

   type Loop_Gain_Pre_K_Type is (
      _K,
      _2K,
      _3K,
      _4K
   );
   
   for Loop_Gain_Pre_K_Type use (
      _K => 0,
      _2K => 1,
      _3K => 2,
      _4K => 3
   );

   type Loop_Gain_Post_K_Type is (
      K,
      Half_K
   );

   for Loop_Gain_Post_K_Type use (
      K => 0,
      Half_K => 1
   );

   type FOC_Limit_Type is (
      No_Limit,
      BW_Over_8,
      BW_Over_4,
      BW_Over_2
   );

   for FOC_Limit_Type use (
      No_Limit => 0,
      BW_Over_8 => 1,
      BW_Over_4 => 2,
      BW_Over_2 => 3
   );

   type Frequency_Offset_Compensation_Register is record
      CS_Gate : Bit;
      Pre_K : Loop_Gain_Pre_K_Type;
      Post_K : Loop_Gain_Post_K_Type;
      Limit : FOC_Limit_Type;
   end Frequency_Offset_Compensation_Register;
   
   for Frequency_Offset_Compensation_Register use (
      CS_Gate at 0 range 5..5,
      Pre_K at 0 range 3..4,
      Post_K at 0 range 2..2,
      Limit at 0 range 0..1
   );

   for Frequency_Offset_Compensation_Register'Size use 8;

   type BS_Limit_Type is (
      No_Limit,
      _3_125_Percent,
      _6_25_Percent,
      _12_5_Percent
   );

   for BS_Limit_Type use (
      No_Limit => 0,
      _3_125_Percent => 1,
      _6_25_Percent => 2,
      _12_5_Percent => 3
   );
      
   type Bit_Synchronization_Register is record
      Pre_Ki : Loop_Gain_Pre_K_Type;
      Pre_Kp : Loop_Gain_Pre_K_Type;
      Post_Ki : Loop_Gain_Post_K_Type;
      Post_Kp : Loop_Gain_Post_K_Type;
      Limit : BS_Limit_Type;
   end Bit_Synchronization_Register;
   
   for Bit_Synchronization_Register use (
      Pre_Ki at 0 range 6..7,
      Pre_Kp at 0 range 4..5,
      Post_Ki at 0 range 3..3,
      Post_Kp at 0 range 2..2,
      Limit at 0 range 0..1
   );

   for Bit_Synchronization_Register'Size use 8;

   type Max_DVGA_Gain_Type is (
      All_Settings_Useable,
      Highest_Setting_Unusable,
      Second_Highest_Setting_Unsuable,
      Third_Highest_Setting_Unusable
   );

   for Max_DVGA_Gain_Type use (
      All_Settings_Usable => 0,
      Highest_Setting_Unusable => 1,
      Second_Highest_Setting_Unusable => 2,
      Third_Highest_setting_Unusable => 3
   );

   type Max_LNA_Gain_Type is (
      Max_Possible_Gain,
      _2dB6_Below_Max,
      _6dB1_Below_Max,
      _7dB4_Below_Max,
      _9dB2_Below_Max,
      _11dB5_Below_Max,
      _14dB6_Below_Max,
      _17dB1_Below_Max
   );

   for Max_LNA_Gain_Type use (
      Max_Possible_Gain => 0,
      _2dB6_Below_Max => 1,
      _6dB1_Below_Max => 2,
      _7dB4_Below_Max => 3,
      _9dB2_Below_Max => 4,
      _11dB5_Below_Max => 5,
      _14dB6_Below_Max => 6,
      _17dB1_Below_Max => 7
   );

   type Magnitude_Target is (
      _24dB,
      _27dB,
      _30dB,
      _33dB,
      _36dB,
      _38dB,
      _40dB,
      _42dB
   );

   for Magnitude_Target use (
      _24dB => 0,
      _27dB => 1,
      _30dB => 2,
      _33dB => 3,
      _36dB => 4,
      _38dB => 5,
      _40dB => 6,
      _42dB => 7
   );

   type LNA_Priority_Type is (
      LNA2_Decrease_First,
      LNA1_Decrease_First
   );
   
   for LNA_Priority_Type use (
      LNA2_Decrease_First => 0,
      LNA1_Decrease_First => 1
   );

   type Carrier_Sense_Relative_Threshold_Type is (
      Disabled,
      _6dB_Increase_In_RSSI,
      _10dB_Increase_In_RSSI,
      _14dB_Increase_In_RSSI
   );
   
   for Carrier_Sense_Relative_Threshold_Type use (
      Disabled => 0,
      _6dB_Increase_In_RSSI => 1,
      _10dB_Increase_In_RSSI => 2,
      _14dB_Increase_In_RSSI => 3
   );
   
   type Carrier_Sense_Absolute_Threshold_Type is (
      Disabled,
      _7dB_Below_Magnitude_Target,
      _6dB_Below_Magnitude_Target,
      _5dB_Below_Magnitude_Target,
      _4dB_Below_Magnitude_Target,
      _3dB_Below_Magnitude_Target,
      _2dB_Below_Magnitude_Target,
      _1dB_Below_Magnitude_Target,
      _At_Magnitude_Target,
      _1dB_Above_Magnitude_Target,
      _2dB_Above_Magnitude_Target,
      _3dB_Above_Magnitude_Target,
      _4dB_Above_Magnitude_Target,
      _5dB_Above_Magnitude_Target,
      _6dB_Above_Magnitude_Target,
      _7dB_Above_Magnitude_Target
   );

   for Carrier_Sense_Absolute_Threshold_Type use (
      Disabled => -8,
      _7dB_Below_Magnitude_Target => -7,
      _6dB_Below_Magnitude_Target => -6,
      _5dB_Below_Magnitude_Target => -5,
      _4dB_Below_Magnitude_Target => -4,
      _3dB_Below_Magnitude_Target => -3,
      _2dB_Below_Magnitude_Target => -2,
      _1dB_Below_Magnitude_Target => -1,
      _At_Magnitude_Target => 0,
      _1dB_Above_Magnitude_Target => 1,
      _2dB_Above_Magnitude_Target => 2,
      _3dB_Above_Magnitude_Target => 3,
      _4dB_Above_Magnitude_Target => 4,
      _5dB_Above_Magnitude_Target => 5,
      _6dB_Above_Magnitude_Target => 6,
      _7dB_Above_Magnitude_Target => 7
   );

   type Hysteresis_Level_Type is (
      None,
      Low,
      Medium,
      High
   );

   for Hysteresis_Level_Type use (
      None => 0,
      Low => 1,
      Medium => 2,
      High => 3
   );

   type AGC_Wait_Time_Type is (
      _8_Samples,
      _16_Samples,
      _24_Samples,
      _32_Samples
   );
   
   for AGC_Wait_Time_Type use (
      _8_Samples => 0,
      _16_Samples => 1,
      _24_Samples => 2,
      _32_Samples => 3
   );

   type AGC_Freeze_Type is (
      Normal,
      Freeze_On_Sync_Word,
      Manually_Freeze_Analog_Gain,
      Override_AGC
   );
   
   for AGC_Freeze_Type use (
      Normal => 0,
      Freeze_On_Sync_Word => 1,
      Manually_Freeze_Analog_Gain => 2,
      Override_AGC => 3
   );

   type AGC_Filter_Length_Type is (
      _8_Samples_4dB,
      _16_Samples_8dB,
      _32_Samples_12dB,
      _64_Samples_16dB
   );
   
   for AGC_Filter_Length_Type use (
      _8_Samples_4dB => 0,
      _16_Samples_8dB => 1,
      _32_Samples_12dB => 2,
      _64_Samples_16dB => 3
   );

   type AGC_Control_Register is record
      Max_DVGA_Gain : Max_DVGA_Gain_Type;
      Max_LNA_Gain : Max_LNA_Gain_Type;
      Magnitude_Target : Magnitude_Target_Type;
      LNA_Priority : LNA_Priority_Type;
      Carrier_Sense_Relative_Threshold : Carrier_Sense_Relative_Threshold_Type;
      Carrier_Sense_Absolute_Threshold : Carrier_Sense_Absolute_Threshold_Type;
      Hysteresis_Level : Hysteresis_Level_Type;
      Wait_Time : AGC_Wait_Time_Type;
      Freeze : AGC_Freeze_Type;
      Filter_Length : AGC_Filter_Length_Type;
   end AGC_Control_Register;

   for AGC_Control_Register use (
      Max_DVGA_Gain at 2 range 6..7,
      Max_LNA_Gain at 2 range 3..5,
      Magnitude_Target at 2 range 0..2,
      LNA_Priority at 1 range 6..6,
      Carrier_Sense_Relative_Threshold at 1 range 4..5,
      Carrier_Sense_Absolute_Threshold at 1 range 0..3,
      Hysteresis_Level at 0 range 6..7,
      Wait_Type at 0 range 4..5,
      Freeze at 0 range 2..3,
      Filter_Length at 0 range 0..1
   );

end CC011L_Registers;

