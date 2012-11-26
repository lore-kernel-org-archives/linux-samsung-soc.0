From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/3] regulator: add device tree support for max8997
Date: Mon, 26 Nov 2012 19:16:04 +0530
Message-ID: <CAJuYYwTt+1-zU3092GmrK2GHR=5QDGT-diVcm_0pe3=oqhuQdA@mail.gmail.com>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
	<1353657795-1725-4-git-send-email-thomas.abraham@linaro.org>
	<20121124175954.GI4719@opensource.wolfsonmicro.com>
	<CAJuYYwThsFutYnYg2scmfqUAGxBM2pWmRmoTww+OyZgUuA-7vg@mail.gmail.com>
	<20121126095141.GC9411@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126095141.GC9411@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Rajendra Nayak <rnayak@ti.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: linux-samsung-soc@vger.kernel.org

On 26 November 2012 15:21, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Sat, Nov 24, 2012 at 11:46:51PM +0530, Thomas Abraham wrote:
>
>> The max8997 driver is mainlined. I actually meant to say that, this v6
>> version of dt support patch for max8997, is similar in functionality
>> to the v5 version of this patch. I did prepare this patch based on
>> your latest for-next branch.
>
> I find it hard to believe that this was generated against for-next, this
> was where I tried to apply it...

I tried again to apply this patch on 'for-next' branch of your
regulator tree (git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git)

on top of commit 6aa588f43d4a (Merge remote-tracking branches
'regulator/fix/wm831x', 'regulator/topic/as3711',
'regulator/topic/da9055', 'regulator/topic/hotplug',
'regulator/topic/lp8788'.....)

and this patch applied cleanly. Could you please let me know if there
is anything I need to be doing differently for this.

Thanks,
Thomas.
