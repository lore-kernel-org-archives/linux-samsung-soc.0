From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/3] regulator: add device tree support for max8997
Date: Mon, 26 Nov 2012 20:13:23 +0530
Message-ID: <CAJuYYwRRauS54nt3QxyofqSyKGcJ+T_9tnjGSt60LtGOnP+ccA@mail.gmail.com>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
	<1353657795-1725-4-git-send-email-thomas.abraham@linaro.org>
	<20121124175954.GI4719@opensource.wolfsonmicro.com>
	<CAJuYYwThsFutYnYg2scmfqUAGxBM2pWmRmoTww+OyZgUuA-7vg@mail.gmail.com>
	<20121126095141.GC9411@opensource.wolfsonmicro.com>
	<CAJuYYwTt+1-zU3092GmrK2GHR=5QDGT-diVcm_0pe3=oqhuQdA@mail.gmail.com>
	<20121126141108.GK9411@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126141108.GK9411@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Rajendra Nayak <rnayak@ti.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: linux-samsung-soc@vger.kernel.org

On 26 November 2012 19:41, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 26, 2012 at 07:16:04PM +0530, Thomas Abraham wrote:
>
>> and this patch applied cleanly. Could you please let me know if there
>> is anything I need to be doing differently for this.
>
> Hrm, try applying it on the relevant topic branch.  Your comments about
> rebasing on top of MFD changes did suggest that there's something in the
> MFD tree so I didn't check terribly closely.

I tried applying this patch on the max8997 branch in your regulator
tree. But this patch does not apply cleanly on that branch because
commits "5eb9f2b96381" (regulator: remove use of __devexit_p),
"a5023574d120" (regulator: remove use of __devinit) and "8dc995f56ef7"
(regulator: remove use of __devexit) are not available on this branch
but these commits are already in your for-next branch.

I am not sure if it is of any help in rebasing this patch to the
existing max8997 branch. If you could suggest on how I could prepare
this patch so that applies cleanly for you, I could do that.

Thanks,
Thomas.
