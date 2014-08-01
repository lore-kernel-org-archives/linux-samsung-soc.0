From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 14/15] drm/exynos: Move DP setup into commit()
Date: Fri, 1 Aug 2014 15:11:37 +0530
Message-ID: <CAEC9eQPARFrDP8k31v_P=ve5DK9Kx9Ao6ZBRuDt2bVS3eegiQQ@mail.gmail.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-15-git-send-email-ajaykumar.rs@samsung.com>
 <20140801091834.GE21724@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140801091834.GE21724@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 1, 2014 at 2:48 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Jul 31, 2014 at 11:12:13PM +0530, Ajay Kumar wrote:
>> Add commit callback for exynos_dp, and move the DP link training,
>> video configuration code from the hotplug handler into commit().
>>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_dp_core.c |   24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> This is not related to the other patches in the series, so it can be
> applied independently.
This patch should go in this series only.
[PATCH 15/15] has dependency on this because it modifies exynos_dp_commit().

> Sean, this looks like a back-/forward-port of the patch you linked to in
> reply to an earlier version of the series, does this still correspond to
> what you think it should be doing? (hence not trimming the quote)
Sean said one of his test app fails since exynos_dp_commit was missing
in previous version of this patch.
Now, I have added exynos_dp_commit as he suggested, and the side effect
because of this addition (video reconfiguration glitch) is taken care by the
panel calls in the next patch [PATCH 15/15].

Ajay

>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> index 31c3de9..347dec9 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
>>  static void exynos_dp_hotplug(struct work_struct *work)
>>  {
>>       struct exynos_dp_device *dp;
>> -     int ret;
>>
>>       dp = container_of(work, struct exynos_dp_device, hotplug_work);
>>
>> +     if (dp->drm_dev)
>> +             drm_helper_hpd_irq_event(dp->drm_dev);
>> +}
>> +
>> +static void exynos_dp_commit(struct exynos_drm_display *display)
>> +{
>> +     struct exynos_dp_device *dp = display->ctx;
>> +     int ret;
>> +
>>       ret = exynos_dp_detect_hpd(dp);
>>       if (ret) {
>>               /* Cable has been disconnected, we're done */
>> @@ -1050,8 +1058,10 @@ static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
>>       }
>>  }
>>
>> -static void exynos_dp_poweron(struct exynos_dp_device *dp)
>> +static void exynos_dp_poweron(struct exynos_drm_display *display)
>>  {
>> +     struct exynos_dp_device *dp = display->ctx;
>> +
>>       if (dp->dpms_mode == DRM_MODE_DPMS_ON)
>>               return;
>>
>> @@ -1059,10 +1069,13 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
>>       exynos_dp_phy_init(dp);
>>       exynos_dp_init_dp(dp);
>>       enable_irq(dp->irq);
>> +     exynos_dp_commit(display);
>>  }
>>
>> -static void exynos_dp_poweroff(struct exynos_dp_device *dp)
>> +static void exynos_dp_poweroff(struct exynos_drm_display *display)
>>  {
>> +     struct exynos_dp_device *dp = display->ctx;
>> +
>>       if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>>               return;
>>
>> @@ -1078,12 +1091,12 @@ static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
>>
>>       switch (mode) {
>>       case DRM_MODE_DPMS_ON:
>> -             exynos_dp_poweron(dp);
>> +             exynos_dp_poweron(display);
>>               break;
>>       case DRM_MODE_DPMS_STANDBY:
>>       case DRM_MODE_DPMS_SUSPEND:
>>       case DRM_MODE_DPMS_OFF:
>> -             exynos_dp_poweroff(dp);
>> +             exynos_dp_poweroff(display);
>>               break;
>>       default:
>>               break;
>> @@ -1094,6 +1107,7 @@ static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
>>  static struct exynos_drm_display_ops exynos_dp_display_ops = {
>>       .create_connector = exynos_dp_create_connector,
>>       .dpms = exynos_dp_dpms,
>> +     .commit = exynos_dp_commit,
>>  };
>>
>>  static struct exynos_drm_display exynos_dp_display = {
>> --
>> 1.7.9.5
>>
