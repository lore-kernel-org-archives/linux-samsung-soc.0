From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 3/9] drm/panel: Add driver for exynos_dp based panels
Date: Tue, 22 Apr 2014 20:23:03 +0530
Message-ID: <CAEC9eQPnmx+EDk3FK7V+gbf6eP9SXyBHQVOxHUGHG82iyK2zbA@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
	<20140422082606.GB17275@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:35540 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932661AbaDVOxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 10:53:04 -0400
Received: by mail-ve0-f174.google.com with SMTP id oz11so9495655veb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 07:53:03 -0700 (PDT)
In-Reply-To: <20140422082606.GB17275@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Thierry,


On Tue, Apr 22, 2014 at 1:56 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Apr 22, 2014 at 04:09:12AM +0530, Ajay Kumar wrote:
>> This patch adds a simple driver to handle all the LCD and LED
>> powerup/down routines needed to support eDP/eDP-LVDS panels
>> supported on exynos boards.
>>
>> The LCD and LED units are usually powered up via regulators,
>> and almost on all boards, we will have a BL_EN pin to enable/
>> disable the backlight. Sometimes, we can have LCD_EN switches
>> as well. The routines in this driver can be used to control
>> panel power sequence on such boards.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>       Added routine for post_disable, removed few unwanted headers.
>>       Refactored a lot of code.
>>
>>  .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++++
>>  drivers/gpu/drm/panel/Kconfig                      |    9 +
>>  drivers/gpu/drm/panel/Makefile                     |    1 +
>>  drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 ++++++++++++++++++++
>>  4 files changed, 306 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
>>  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
>
> What this patch does is in no way Exynos specific. It is also not eDP
> specific.
>
Right. This is not at all writing into any "exynos" specific register,
but can't this be just a placeholder for all the panel controls
which can serve boards which use exynos_dp?

> This conflates panel drivers with board drivers in a strange way. Panel
> drivers should be for *panels*, not for a given SoC or specific outputs
> on that SoC.
>
Right. But for that matter, even the "panel-simple" driver is doing the same,
which is just a placeholder for "generic" panel controls which serves
multiple boards.
I din't choose to reuse that because the boards which I have expect more
control over the panel sequence as mentioned before.
If you don't mind, I can fit in all these settings into panel-simple
driver itself ;)
But again, I should be able to register the panel driver much before
exynos_dp gets probed, That's the actual catch!


Thanks and regards,
Ajay Kumar
