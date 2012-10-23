From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined
Date: Tue, 23 Oct 2012 15:57:22 +0100
Message-ID: <5086B052.3030105@arm.com>
References: <022101cdb12d$724e9650$56ebc2f0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:32936 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757032Ab2JWO51 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:57:27 -0400
In-Reply-To: <022101cdb12d$724e9650$56ebc2f0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 23/10/12 15:48, Kukjin Kim wrote:
> Hi all,
> 
> Now, v3.7-rc2 happens following build error with s3c2410_defconfig...
> 
> ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make[1]: *** Waiting for unfinished jobs....
> 
> Any idea on this?

This is becoming a recurring pattern...

Please see:
https://patchwork.kernel.org/patch/1570611/
https://lkml.org/lkml/2012/10/9/393

and probably a few other instances...

	M.
-- 
Jazz is not dead. It just smells funny...
