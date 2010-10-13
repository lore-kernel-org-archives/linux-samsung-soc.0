From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 4/6] ARM: S5P: Add EPLL rate change warning
Date: Wed, 13 Oct 2010 09:25:52 +0100
Message-ID: <20101013082552.GE6424@rakim.wolfsonmicro.main>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
 <1286883983-27790-1-git-send-email-sw.youn@samsung.com>
 <002301cb6aac$12a05e10$37e11a30$%kim@samsung.com>
 <20101013080902.GA6424@rakim.wolfsonmicro.main>
 <002801cb6aaf$b19368c0$14ba3a40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34122 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753133Ab0JMIZ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 04:25:59 -0400
Content-Disposition: inline
In-Reply-To: <002801cb6aaf$b19368c0$14ba3a40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Wed, Oct 13, 2010 at 05:21:48PM +0900, Kukjin Kim wrote:
> Mark Brown wrote:

> > Personally I don't think it really makes much odds so long as the
> > message is displayed on the console by default.

> Hmm...yeah I mean just EPLL is used only in the audio and SPI now. However
> we don't know which driver will use it later. And as you said, need to show
> it. Ok...will apply.

FWIW the particular favourite that users run into with some of the CPUs
is USB.
