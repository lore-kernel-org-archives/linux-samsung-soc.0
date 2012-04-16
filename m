From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 2/2] regulator: add device tree support for max8997
Date: Tue, 17 Apr 2012 00:26:57 +0530
Message-ID: <CAJuYYwSK=T3Fi=mOwjuBciEbG9dD5x8PvqGO3mfF-4qdL50QrA@mail.gmail.com>
References: <1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
	<20120416185153.GH3219@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:35768 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345Ab2DPS47 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Apr 2012 14:56:59 -0400
Received: by vbbff1 with SMTP id ff1so3602753vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Apr 2012 11:56:59 -0700 (PDT)
In-Reply-To: <20120416185153.GH3219@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Rajendra Nayak <rnayak@ti.com>

On 17 April 2012 00:21, Mark Brown <broonie@opensource.wolfsonmicro.com=
> wrote:
> On Sat, Mar 24, 2012 at 03:19:50PM +0530, Thomas Abraham wrote:
>> Add device tree based discovery support for max8997.
>
> I tried to apply this but it's collided with some other changes in th=
e
> driver which have arrived in the meantime and the rejects were too la=
rge
> to fix up. =A0I suspect it's mostly just the change in parameters for
> regulator_register(). =A0Can you please regenerate against my current
> topic/drivers branch?

Hi Mark,

Sure, I will do redo this patch based on your current 'topic/drivers' b=
ranch.

Thanks,
Thomas.
