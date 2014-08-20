From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 5/6] ARM: dts: Add vmmc and vqmmc supplies for Peach Pit
 and Pi boards
Date: Wed, 20 Aug 2014 11:49:24 +0200
Message-ID: <53F46F24.9020800@collabora.co.uk>
References: <1408460913-13863-1-git-send-email-javier.martinez@collabora.co.uk>	<1408460913-13863-6-git-send-email-javier.martinez@collabora.co.uk>
 <CAD=FV=V9oct-iJ==1SLdxusq68AY3utMQF+MbX0Uf+2dC0mwww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=V9oct-iJ==1SLdxusq68AY3utMQF+MbX0Uf+2dC0mwww@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Doug,

On 08/19/2014 06:26 PM, Doug Anderson wrote:
> 
> While your change is correct, I have a worry that it will break things
> if it's merged before some patches that Yuvaraj is working on.
> 
> Specifically the problem on pit and pi (and any exynos5250 / 5420 /
> 5800 / ... boards using the built-in "card detect") is that the card
> detect line is on the same power rail as "vqmmc".  That means you
> can't turn off vqmmc if you still need to be able to detect card
> insertions.
> 
> ...but you can't turn off vmmc without turning off vqmmc, otherwise
> current will leak through the IO lines into the card, which is bad.
> 
> 
> Right now the SDMMC core will try to turn off power to the card at two times:
> 1. when the card is ejected
> 2. when it's trying to reset the card
> 
> 
> Obviously the first problem is a huge problem on exynos because it
> means that we won't be able to detect card insertions.  ...but we
> still want to turn the power off from #2.  To really fix the problem I
> think the core needs to be extended to treat the above as two separate
> cases.
>

Thanks a lot for the explanation, now I remember reading about this on
thread "[PATCH 2/3] mmc: dw_mmc: Dont cut off vqmmc and vmmc" [0] but
didn't think in the side effect when adding this patch...

> 
> Your patch might work at the moment because I think dw_mmc doesn't
> actually try to turn off these rails with the main SDMMC core asks it
> to.  ...but I still worry about merging them before Yuvaraj's changes
> are ready.
> 

Agreed, I'll drop this patch and wait for Yuvaraj's series to land first.

Yuvaraj's "UHS support for dw_mmc driver" series that should contain the
change you are referring had the issue that when the tps65090 fet4 was
used as vmmc-supply, mmc_regulator_get_supply() was failing.

I posted a bunch of patches to fix that issue and there were already
merged on the relevant trees and shows on linux-next:

e1da8cd mmc: core: Use regulator_get_voltage() if OCR mask is empty.
a130548 ARM: dts: Improve Peach Pit and Pi power scheme
4f2352c regulator: tps65090: Set voltage for fixed regulators
26988ef regulator: core: Allow to get voltage count and list from parent
e303996 regulator: core: Get voltage from parent if not available

So hopefully his series have no blockers anymore.

> 
> -Doug
> 

Best regards,
Javier

[0]: https://www.mail-archive.com/linux-mmc@vger.kernel.org/msg27152.html
