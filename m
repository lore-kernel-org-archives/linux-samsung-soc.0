From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 1/8] drm/panel: Add prepare, unprepare and get_modes routines
Date: Wed, 30 Jul 2014 15:59:20 +0530
Message-ID: <CAEC9eQPa3xGb4Z=gRqaN8SUyJsjyyBHb8ubk0=ZtW4EwPWNpCg@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406316130-4744-2-git-send-email-ajaykumar.rs@samsung.com>
	<20140730100028.GD29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:36099 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbaG3K3V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 06:29:21 -0400
In-Reply-To: <20140730100028.GD29590@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Wed, Jul 30, 2014 at 3:30 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, Jul 26, 2014 at 12:52:03AM +0530, Ajay Kumar wrote:
>> Most of the panels need an init sequence as mentioned below:
>>       -- poweron LCD unit/LCD_EN
>>       -- start video data
>>       -- poweron LED unit/BACKLIGHT_EN
>> And, a de-init sequence as mentioned below:
>>       -- poweroff LED unit/BACKLIGHT_EN
>>       -- stop video data
>>       -- poweroff LCD unit/LCD_EN
>> With existing callbacks for drm panel, we cannot accomodate such panels,
>> since only two callbacks, i.e "panel_enable" and panel_disable are supported.
>>
>> This patch adds:
>>       -- "prepare" callback which can be called before
>>       the actual video data is on, and then call the "enable"
>>       callback after the video data is available.
>>
>>       -- "unprepare" callback which can be called after
>>       the video data is off, and use "disable" callback
>>       to do something before switching off the video data.
>>
>> Now, we can easily map the above scenario as shown below:
>>       poweron LCD unit/LCD_EN = "prepare" callback
>>       poweron LED unit/BACKLIGHT_EN = "enable" callback
>>       poweroff LED unit/BACKLIGHT_EN = "disable" callback
>>       poweroff LCD unit/LCD_EN = "unprepare" callback
>>
>> Also, a helper function for get_modes is added.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  include/drm/drm_panel.h |   26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>
> I had already decided to apply an earlier version that you posted (I
> think the only difference was that it didn't have the inline
> implementation for drm_panel_get_modes() yet), reworded the commit
> message a little (to be less specific about LED, LCD and backlight
> units) and added some kerneldoc for struct drm_panel_funcs.
>
> What I propose is to merge that patch (I'll hopefully push it today so
> that it shows up in tomorrow's linux-next) and then apply a separate
> patch to add drm_panel_get_modes().
>
> Do you have any objections to that?
I am okay with that. drm_panel_get_modes() will come as a separate patch.


Ajay
