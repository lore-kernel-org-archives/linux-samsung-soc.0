From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and
 unprepare routines
Date: Tue, 5 Aug 2014 21:41:09 +0530
Message-ID: <CAEC9eQPFnMEptzYiox2-6Z37iOCKgMyqjfYWo6RfRbEFtXW9jg@mail.gmail.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
 <53E0AC0C.9030309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53E0AC0C.9030309@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,


On Tue, Aug 5, 2014 at 3:33 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi Ajay,
>
>
> On 07/31/2014 07:42 PM, Ajay Kumar wrote:
>> Modify exynos_dsi driver to support the new panel calls:
>> prepare and unprepare.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index dc7c80b..4834932 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1351,7 +1351,7 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
>>       if (ret < 0)
>>               return ret;
>>
>> -     ret = drm_panel_enable(dsi->panel);
>> +     ret = drm_panel_prepare(dsi->panel);
>>       if (ret < 0) {
>>               exynos_dsi_poweroff(dsi);
>>               return ret;
>> @@ -1360,6 +1360,13 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
>>       exynos_dsi_set_display_mode(dsi);
>>       exynos_dsi_set_display_enable(dsi, true);
>>
>> +     ret = drm_panel_enable(dsi->panel);
>> +     if (ret < 0) {
>> +             exynos_dsi_set_display_enable(dsi, false);
>
> I guess drm_panel_unprepare(dsi->panel) should be here.
Thanks for pointing it out. I am not sure if Thierry has already
picked this up since Inki has given Acked by.
In that case, you can send it as a fix separately :)

Ajay
>> +             exynos_dsi_poweroff(dsi);
>> +             return ret;
>> +     }
>> +
>>       dsi->state |= DSIM_STATE_ENABLED;
>>
>>       return 0;
>> @@ -1370,8 +1377,9 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
>>       if (!(dsi->state & DSIM_STATE_ENABLED))
>>               return;
>>
>> -     exynos_dsi_set_display_enable(dsi, false);
>>       drm_panel_disable(dsi->panel);
>> +     exynos_dsi_set_display_enable(dsi, false);
>> +     drm_panel_unprepare(dsi->panel);
>>       exynos_dsi_poweroff(dsi);
>>
>>       dsi->state &= ~DSIM_STATE_ENABLED;
>>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
