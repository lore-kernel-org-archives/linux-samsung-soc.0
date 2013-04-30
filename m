From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 4/4] ARM: EXYNOS: remove parent device for hdmiphy clock
Date: Tue, 30 Apr 2013 10:26:55 +0530
Message-ID: <CAPdUM4OV-b+S1pKiMKWgLnquuHTD99m6ayiDWQ7OZTPZwVvxww@mail.gmail.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
	<1367247053-17105-5-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbJQwSqGfoThkyp4gY6vE3dh98ETfk7B7jVM6LH0hPb5sg@mail.gmail.com>
	<517EAFDB.5020506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:36919 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751254Ab3D3E45 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Apr 2013 00:56:57 -0400
Received: by mail-we0-f169.google.com with SMTP id p43so88625wea.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2013 21:56:55 -0700 (PDT)
In-Reply-To: <517EAFDB.5020506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On Mon, Apr 29, 2013 at 11:07 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 04/29/2013 07:04 PM, Sean Paul wrote:
>> On Mon, Apr 29, 2013 at 10:50 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>> Hdmiphy clock flows from hdmiphy hw to hdmi ip and mixer. It is commonly
>>> accessed among hdmi and hdmiphy driver. During power cycle, each of these
>>> driver decrements the ref-count and ensures that last user disables the
>>> clock. Setting parrent device to none ensure that both the drivers gets
>>> access to the clock.
>>>
>>
>> This seems like the wrong solution. I think you should be trying to
>> isolate its usage to one driver, instead of removing devname.
>
> And files:
>         arch/arm/mach-exynos/clock-exynos4.c
>         arch/arm/mach-exynos/clock-exynos5.c
>
> are not existent in linux-next for some time already. Since 3.10 the
> common clock API driver is used. It also shows that very few people
> actually test their patches against -next... :(
>
> Regards,
> Sylwester
>
>> Sean
>>

Thanks Sean, Sylwester,

I will rebase drm hdmi driver to pinctrl, CCF and then post this series
with suggested rework.

regards,
Rahul Sharma.

>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/clock-exynos4.c |    1 -
>>>  arch/arm/mach-exynos/clock-exynos5.c |    1 -
>>>  2 files changed, 2 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
>>> index 8a8468d..a43afcd 100644
>>> --- a/arch/arm/mach-exynos/clock-exynos4.c
>>> +++ b/arch/arm/mach-exynos/clock-exynos4.c
>>> @@ -562,7 +562,6 @@ static struct clk exynos4_init_clocks_off[] = {
>>>                 .ctrlbit        = (1 << 3),
>>>         }, {
>>>                 .name           = "hdmiphy",
>>> -               .devname        = "exynos4-hdmi",
>>>                 .enable         = exynos4_clk_hdmiphy_ctrl,
>>>                 .ctrlbit        = (1 << 0),
>>>         }, {
>>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
>>> index b0ea31f..4f39027 100644
>>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>>> @@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] = {
>>>                 .ctrlbit        = (1 << 6),
>>>         }, {
>>>                 .name           = "hdmiphy",
>>> -               .devname        = "exynos5-hdmi",
>>>                 .enable         = exynos5_clk_hdmiphy_ctrl,
>>>                 .ctrlbit        = (1 << 0),
>>>         }, {
>>> --
>>> 1.7.10.4
>



-- 
Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.
