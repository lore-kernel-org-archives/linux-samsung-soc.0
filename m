From: Harald Welte <laforge@gnumonks.org>
Subject: General comments on current 6440 code
Date: Tue, 10 Nov 2009 15:44:44 +0900
Message-ID: <20091110064444.GD4048@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46582 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbZKJGo4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 01:44:56 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thomas.ab@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hi all!

This is a high-level review of the current 6440 code as it is in in the
next-s3c_s3c6440-topic-arch branch (which is not yet based on next-s3c,
despite the name).

* Kconfig: select S3C_DMA_PL330 should probably not be sone when selectiong
  SMDK6440, but when selecting CPU_S5P6440.  It's not like the PL330
  is an external component on the board.  It's built into the SoC.
* Kconfig: Do we relaly have the same card-detect issue on the SMDK6440
  than on the SMDK6410?  If yes, sad.
* We need to strip the PMIC / volatge scaling part from the core patch,
  as the new regulator framework 8751 driver will be submitted
  independently, and a LTC3714 driver for the regulator framework first
  needs to be written.
* We should not have any new S3C_* defines, unless they are really
  global for many/most samsung SoC's.  All #defines should be 6440
  specific, or 64xx specific (if they are the same as 6400/6410)
* the arch_reset() function seems like it is the same like on many
  or even all other Samsung SoC, with the exception of the wdt register
  base. We should probably consider moving it to plat-s3c or
  plat-samsung at some point. not the most important task, though
* smdk6440: coding style, particularly indentation
* smdk6440: s3c_cs_* functions: If they are SoC-specific, they should not
  be in the smdk file.  If they are SMDK specific, they should not
  have a s3c_ prefix.
* smdk6440: i2c_devs1[] contains s5m8751.  I think this is not the
  case on a standard SMDK, right?  Should probably be dependent
  on #ifdef CONFIG_SMDK6440_HAS_S5M8751
* smdk6440: Ben Dooks is not the maintainer for the SMDK6440
* All files: please update copyright correclty. Copyright should be
  Samsung Electronics, then indicate from on which of ben's code
  this was based, followed by Ben's/Simtec's copyright.
* Why do we have RTC functions in the SMDK file? The RTC is an IP
  core in the SoC, it is not a component on the board.
* s5p6440_cpu_suspend() seems similar to s3c64xx_cpu_suspend(),
  while the latter does some additional work in the PWR_CFG and
  WAKEUP_STAT registers.  check if the 6440 is really that different
  from the 6410
* s3c64xx_timer_setup() is 95% identical with s3c24xx_timer_setup(),
  rather than copying we should try to keep this one function.  Maybe
  a run-time CPU detection function is the way to go, where we can
  put 644x specific blocks into an if (cpu_is()). I know Ben's aversion
  against this, but he is mostly talking about misusing it in device
  drivers, while this case it is a core arm/arch/ function
* adc.c: How different is this ADC from the 24xx and 6410 ADC? We should
  again use one driver, not a copy.
* spi: the SPI clock source should be a runtime decision based on the
  platform data. getting the various clocks should happen inside the
  driver.  Remember: the compiled SPI driver has to work on any board,
  and every board might use a different SPI clock source configuration.
* Also, SPI support should be split into a separate patch
* all the include/plat/regs-* files have a S3C_ prefix.  I think for
  files in plat-s5p, this is always wrong.  Either the definition is
  shared between old S3C_* and new S5P_* soc's, then the file should go
  to plat-s3c (soon plat-samsung).  Or the definition is specific to
  s5p, then the register name should start with S5P
* ltc3714: this needs to be turned into a real driver.  This means
  * gpio assignments for VID control are passed in via platform_data
  * the driver impleemnts a voltage regulator driver using the standard
    interface
* s5m8751: remove this from 6440 patchset
* sleep.S seems again almost unmodified to 6410.  Do we really need
  the modifications at all, or can we use a shared sleep.S file?

So as you can see, there is a lot of work to be done.  The nice thing
is, it can be divided very good among everyone who will participate,
as soon as we have a public branch that is really based off next-s3c.

-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
