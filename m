From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow
 board
Date: Tue, 24 Dec 2013 12:12:27 +0900
Message-ID: <1b0b01cf0055$f9d15720$ed740560$@samsung.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
 <CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>
 <52A62E7A.1010006@samsung.com>
 <CAOesGMha3i+k+aBSivJopRxoi1rxAaF+ktU4KG9vfTf54A8f8Q@mail.gmail.com>
 <52B1F905.1060206@samsung.com>
 <CAOesGMhBMh6+DJTXSDcmQWk8EAPJG1O0ZWwGJuNC_A8k6fgegw@mail.gmail.com>
 <1af501cf0047$3362ba60$9a282f20$@samsung.com>
 <CAOesGMhuvTBUBwg64eRXz0Dpzp8MNMdncCt-ipQXjixGKFONoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35937 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737Ab3LXDMb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 22:12:31 -0500
In-reply-to: <CAOesGMhuvTBUBwg64eRXz0Dpzp8MNMdncCt-ipQXjixGKFONoQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Yuvaraj Kumar C D' <yuvaraj.cd@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, 'Ian Campbell' <ian.campbell@citrix.com>, devicetree@vger.kernel.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Alim Akhtar' <alim.akhtar@samsung.com>, 'Sonny Rao' <sonnyrao@chromium.org>, 'Yuvaraj Kumar C D' <yuvaraj.cd@samsung.com>

Olof Johansson wrote:
> 
> On Mon, Dec 23, 2013 at 5:26 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Olof Johansson wrote:
> >>
> >> On Wed, Dec 18, 2013 at 11:35 AM, Kukjin Kim <kgene.kim@samsung.com>
> > wrote:
> >> > On 12/19/13 03:38, Olof Johansson wrote:
> >> >>
> >> >> On Mon, Dec 9, 2013 at 12:56 PM, Kukjin Kim<kgene.kim@samsung.com>
> >> wrote:
> >> >>>
> >> >>> On 12/10/13 01:16, Doug Anderson wrote:
> >> >>>>
> >> >>>>
> >> >>>> Yuvaraj,
> >> >>>>
> >> >>>> On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C
> >> D<yuvaraj.cd@gmail.com>
> >> >>>> wrote:
> >> >>>>>
> >> >>>>>
> >> >>>>> Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
> >> >>>>> for exynos5250") missed out handling the exynos5250 snow dts
file.
> >> >>>>>
> >> >>>>> Signed-off-by : Abhilash Kesavan<a.kesavan@samsung.com>
> >> >>>>>
> >> >>>>> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
> >> >>>>> ---
> >> >>>>>    arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
> >> >>>>>    arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
> >> >>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
> >> >>>>>
> >> >>>>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
> >> >>>>> b/arch/arm/boot/dts/cros5250-common.dtsi
> >> >>>>> index 6470536..1ceb62e 100644
> >> >>>>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> >> >>>>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> >> >>>>> @@ -247,10 +247,6 @@
> >> >>>>>                   };
> >> >>>>>           };
> >> >>>>>
> >> >>>>> -       mmc@12210000 {
> >> >>>>> -               status = "disabled";
> >> >>>>> -       };
> >> >>>>> -
> >> >>>>>           mmc@12220000 {
> >> >>>>>                   num-slots =<1>;
> >> >>>>>                   supports-highspeed;
> >> >>>>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
> >> >>>>> b/arch/arm/boot/dts/exynos5250-snow.dts
> >> >>>>> index a9395c4..67484d1 100644
> >> >>>>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> >> >>>>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> >> >>>>> @@ -171,11 +171,20 @@
> >> >>>>>                   };
> >> >>>>>           };
> >> >>>>>
> >> >>>>> +       mmc@12200000 {
> >> >>>>> +               status = "okay";
> >> >>>>> +       };
> >> >>>>> +
> >> >>>>> +       mmc@12220000 {
> >> >>>>> +               status = "okay";
> >> >>>>> +       };
> >> >>>>> +
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>> I probably would have put the 12200000 and 12220000 ones in
> >> >>>> cros5250-common since that's where all of the other stuff relating
> to
> >> >>>> those ports is.  Some of it may need to be moved around once we
> get
> >> >>>> the HP Chromebook 11 (exynos5250-spring) in place, but until then
> it
> >> >>>> seems best to keep it all together.
> >> >>>>
> >> >>>> -Doug
> >> >>>
> >> >>>
> >> >>>
> >> >>> OK, sounds better, I don't know well about the HP Chromebook though
> > ;-)
> >> >>
> >> >>
> >> >> This broke linux-next on snow ever since the original patch went in.
> >> >> Please squash the above into the original patch or at the very least
> >> >> apply it as soon as possible.
> >> >>
> >> > Oops, OK. I've applied this separately just now.
> >>
> >> Since you hadn't applied this to the branch you sent me, I now have an
> >> arm-soc for-next branch that doesn't boot on Chromebooks.
> >>
> > Because 1st pull request already has been sent out to arm-soc when I
> picked
> > this into samsung tree after your inform. So I couldn't.
> 
> Ah. A comment on the old pull request to give us a heads up would have
> been useful.
> 
You're right. OK, I will.

> >> I've picked up the above patch directly into arm-soc. Please drop it
> >> from your branch.
> >>
> > You mean, I need to re-sort out my 2nd pull-request already sent out?
> IMHO,
> > would be better to us if you could pull my 2nd pull-request and drop
> your
> > picking up...
> 
> Ok, I'll look at doing that. It's unfortunate that it's broken across
> a wider set of changes though, if we ever need to bisect across it for
> some reason.
> 
Agreed, I will look at my branch with more attention.

Thanks a lot.

- Kukjin
