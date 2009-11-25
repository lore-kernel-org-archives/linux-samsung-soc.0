From: Mikhail Lodygin <mishal@softerra.com>
Subject: [PATCH 5/6] S3C64XX SPI: SPI Controller driver for S3C64XX
Date: Wed, 25 Nov 2009 20:10:38 +0000 (UTC)
Message-ID: <loom.20091125T210941-967@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:54596 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932187AbZKYUPA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2009 15:15:00 -0500
Received: from list by lo.gmane.org with local (Exim 4.50)
	id 1NDOGY-00067V-Bc
	for linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2009 21:15:06 +0100
Received: from mail.softerra.com ([194.187.154.186])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2009 21:15:06 +0100
Received: from mishal by mail.softerra.com with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2009 21:15:06 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

+static struct spi_board_info smdk6410_spi_devices[] __initdata = {
+	{
+		.modalias	 = "spidev",
+		.mode		 = SPI_MODE_0,
+		.max_speed_hz    = 4000000,
+		.bus_num	 = 0,
+		.chip_select	 = 0,
+		.controller_data = &smdk6410_spi1_csi[SMDK6410_SPIDEV_CS],
+	},
+};

smdk6410_spi1_csi is not declared in the file
maybe smdk6410_spi0_csi instead?
