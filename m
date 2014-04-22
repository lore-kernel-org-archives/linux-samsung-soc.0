From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v2 PATCH v2 06/14] drm/exynos: support MIPI DSI command mode
Date: Tue, 22 Apr 2014 10:06:13 +0900
Message-ID: <5355C085.8000703@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
 <1460689.BVNsEv5Rlh@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1460689.BVNsEv5Rlh@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, sachin.kamat@linaro.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Laurent,

Thank you for the comment.

On 04/22/2014 07:52 AM, Laurent Pinchart wrote:
> Hi YoungJun,
>
> Thank you for the patch.
>
> On Monday 21 April 2014 21:28:33 YoungJun Cho wrote:
>> This patch adds I80 interface for FIMD to support command mode panel.
>>
>> For this, the below features are added:
>> - Sets display interface mode relevant registers properly according to the
>>    interface type from DT
>> - Adds drm_panel_cpu_timings structure
>>   . The command mode panel sets them as the private attributes in struct
>>     drm_display_mode and FIMD gets them by fimd_mode_set().
>> - Adds TE interrupt handler
>>    . FIMD driver should know TE signal from lcd panel to avoid tearing issue.
>> - Adds trigger feature
>>    . In case of command mode panel, FIMD should set trigger bit,
>>      so that image data has to be transferred to display bus or lcd panel.
>>
>> Changelog v2:
>> - Moves CPU timings relevant properties to panel DT
>>    (commented by Laurent Pinchart, Andrzej Hajda)
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/Kconfig           |    1 +
>>   drivers/gpu/drm/exynos/exynos_drm_crtc.c |   11 ++
>>   drivers/gpu/drm/exynos/exynos_drm_crtc.h |    2 +
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h  |    2 +
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   13 ++
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c |  280 ++++++++++++++++++++++-----
>>   include/drm/drm_mipi_dsi.h               |    2 +
>>   include/drm/drm_panel.h                  |    7 +
>
> Could you please split the DRM core changes into two separate standalone
> patches (as they're unrelated to each other) ?

Ok, it could be split into core and driver ones.
The DRM core changes are required to link with TE irq handler callback.

I'll do it next patch set.

Thank you.
Best regards YJ

>
>>   include/video/samsung_fimd.h             |    3 +-
>>   9 files changed, 277 insertions(+), 44 deletions(-)
>
> [snip]
>
