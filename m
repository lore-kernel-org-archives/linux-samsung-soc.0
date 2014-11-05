From: Juergen Borleis <juergen127@kreuzholzen.de>
Subject: Re: Samsung S3C6410 SoC/devicetree: how to describe RTC interrupts connected to two different interrupt parents?
Date: Wed, 5 Nov 2014 18:17:47 +0100
Message-ID: <201411051817.47990.juergen127@kreuzholzen.de>
References: <201411042104.45632.juergen127@kreuzholzen.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:37855 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932403AbaKERTJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Nov 2014 12:19:09 -0500
In-Reply-To: <201411042104.45632.juergen127@kreuzholzen.de>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Myself wrote:
> the Samsung S3C6410 SoC comes with an RTC with two interrupts connected to
> two different interrupt controllers.
>
> The old platform code uses this resource to describe it:
>
> static struct resource s3c_rtc_resource[] = {
> 	[0] = DEFINE_RES_MEM(S3C24XX_PA_RTC, SZ_256),
> 	[1] = DEFINE_RES_IRQ(IRQ_RTC),  <-- channel 2 at VIC0
> 	[2] = DEFINE_RES_IRQ(IRQ_TICK), <-- channel 28 at VIC1
> };
>
> In the devicetree I can define multiple interrupt channels with the
> keyword 'interrupts' but it seems all of them must share the same interrupt
> parent defined via 'interrupt-parent'. How to handle the special S3C6410
> case?
> The file "Documentation/devicetree/bindings/rtc/s3c-rtc.txt" isn't really
> helpful.

Ahh, "interrupts-extended" is the keyword... solved.

jbo
