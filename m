From: Jonathan Miles <jm@reciva.com>
Subject: S3C2412 SPI controller in DMA/FIFO mode
Date: Wed, 12 May 2010 10:45:14 +0100
Message-ID: <4BEA78AA.1090409@reciva.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.reciva.com ([109.169.29.93]:53425 "EHLO crown.reciva.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751685Ab0ELKIE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 06:08:04 -0400
Received: from host86-156-69-106.range86-156.btcentralplus.com ([86.156.69.106] helo=[192.168.106.23])
	by crown.reciva.com with esmtpa (Exim 4.69)
	(envelope-from <jm@reciva.com>)
	id 1OC8V9-0007oZ-FX
	for linux-samsung-soc@vger.kernel.org; Wed, 12 May 2010 10:45:15 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi!

Has anyone had any success in getting the S3C2412 SPI controller to work 
in FIFO or DMA mode? I've been trying for a while now but not managed to 
create anything stable.

I note that the current kernels have s3c24xx_fiq - is this because no 
one else has managed to get FIFO/DMA to work either?

Thanks in advance,

Jonathan

-- 
Reciva Ltd, Unit 1, The Old Granary, Westwick, CAMBRIDGE CB24 3AR
Registered in England & Wales No. 04719949
