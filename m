From: Chen Gang <gang.chen@asianux.com>
Subject: [Suggestion] ARM:S5PV210:  version merging compiling issue for 'struct
 fimc_source_info'
Date: Sat, 16 Feb 2013 17:26:39 +0800
Message-ID: <511F50CF.90403@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:27478 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752886Ab3BPJ0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Feb 2013 04:26:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kyungmin.park@samsung.com, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello Kukjin Kim:

  it is a compiling issue, please help check when you have time.

thanks.

gchen.

in arch/arm/mach-s5pv210/mach-goni.c:848:
  error: unknown field 'bus_type' specified in initializer

843 static struct fimc_source_info goni_camera_sensors[] = {
844         {
845                 .mux_id         = 0,
846                 .flags          = V4L2_MBUS_PCLK_SAMPLE_FALLING |
847                                   V4L2_MBUS_VSYNC_ACTIVE_LOW,
848                 .bus_type       = FIMC_BUS_TYPE_ITU_601,
849                 .board_info     = &noon010pc30_board_info,
850                 .i2c_bus_num    = 0,
851                 .clk_frequency  = 16000000UL,
852         },
853 };


in include/media/s5p_fimc.h:50

 37 /**
 38  * struct fimc_source_info - video source description required for the host
 39  *                           interface configuration
 40  *
 41  * @board_info: pointer to I2C subdevice's board info
 42  * @clk_frequency: frequency of the clock the host interface provides to sensor
 43  * @fimc_bus_type: FIMC camera input type
 44  * @sensor_bus_type: image sensor bus type, MIPI, ITU-R BT.601 etc.
 45  * @flags: the parallel sensor bus flags defining signals polarity (V4L2_MBUS_*)
 46  * @i2c_bus_num: i2c control bus id the sensor is attached to
 47  * @mux_id: FIMC camera interface multiplexer index (separate for MIPI and ITU)
 48  * @clk_id: index of the SoC peripheral clock for sensors
 49  */
 50 struct fimc_source_info {
 51         struct i2c_board_info *board_info;
 52         unsigned long clk_frequency;
 53         enum fimc_bus_type fimc_bus_type;
 54         enum fimc_bus_type sensor_bus_type;
 55         u16 flags;
 56         u16 i2c_bus_num;
 57         u16 mux_id;
 58         u8 clk_id;
 59 };
 60 
