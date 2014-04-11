From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/5] drm/exynos: remove dummy hdmiphy clock from hdmi
 driver
Date: Fri, 11 Apr 2014 07:19:18 +0530
Message-ID: <CAPdUM4NqBtnynyp23mDRpdre+yR3h40wOk-z=xeM3GWj9ParVg@mail.gmail.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
 <1396458826-3051-2-git-send-email-rahul.sharma@samsung.com>
 <5346B985.3000801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5346B985.3000801@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 10 April 2014 21:02, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Rahul,
>
> On 02.04.2014 19:13, Rahul Sharma wrote:
>>
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Exynos drm hdmi driver used to get dummy hdmiphy clock to
>> control the PMU bit for hdmiphy. This clock is removed
>> during CCF migration. This should also be cleaned from
>> hdmi driver.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_hdmi.c |    8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 25bf65a..23abfa0 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -74,7 +74,6 @@ struct hdmi_resources {
>>         struct clk                      *sclk_hdmi;
>>         struct clk                      *sclk_pixel;
>>         struct clk                      *sclk_hdmiphy;
>> -       struct clk                      *hdmiphy;
>>         struct clk                      *mout_hdmi;
>>         struct regulator_bulk_data      *regul_bulk;
>>         int                             regul_count;
>> @@ -1854,7 +1853,6 @@ static void hdmi_poweron(struct exynos_drm_display
>> *display)
>>         if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>>                 DRM_DEBUG_KMS("failed to enable regulator bulk\n");
>>
>> -       clk_prepare_enable(res->hdmiphy);
>>         clk_prepare_enable(res->hdmi);
>>         clk_prepare_enable(res->sclk_hdmi);
>>
>> @@ -1881,7 +1879,6 @@ static void hdmi_poweroff(struct exynos_drm_display
>> *display)
>>
>>         clk_disable_unprepare(res->sclk_hdmi);
>>         clk_disable_unprepare(res->hdmi);
>> -       clk_disable_unprepare(res->hdmiphy);
>>         regulator_bulk_disable(res->regul_count, res->regul_bulk);
>>
>>         pm_runtime_put_sync(hdata->dev);
>> @@ -1977,11 +1974,6 @@ static int hdmi_resources_init(struct hdmi_context
>> *hdata)
>>                 DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
>>                 goto fail;
>>         }
>> -       res->hdmiphy = devm_clk_get(dev, "hdmiphy");
>> -       if (IS_ERR(res->hdmiphy)) {
>> -               DRM_ERROR("failed to get clock 'hdmiphy'\n");
>> -               goto fail;
>> -       }
>>         res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
>>         if (IS_ERR(res->mout_hdmi)) {
>>                 DRM_ERROR("failed to get clock 'mout_hdmi'\n");
>>
>
> This patch makes the series non-bisectable. If you remove handling of this
> dummy clock until you add proper support for PHY isolation setting, then at
> this point you end up with non-working code.
>
> You should first provide new infrastructure in parallel to existing one,
> then move all users to new one and only then drop the old one.
>

Actually, this is dead code since CCF migration. After this patch we will get
probe success but no UI. I will take care about bisection in my series.

Currently planning to discard first 2 patches and rebase on Tomasz
Stanislawski's
1 bit phy patches.

Regards,
Rahul Sharma

> Best regards,
> Tomasz
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
