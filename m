From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/9] Restore parallel display support for Exynos based
 boards
Date: Tue, 18 Mar 2014 14:05:40 +0100
Message-ID: <532844A4.300@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Denis Carikli <denis@eukrea.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On 17.03.2014 11:27, Andrzej Hajda wrote:
> Hi,
>
> This patch set restores parallel display support removed during exynos
> refactorization. It is rebased on the latest exynos-drm-next branch plus patch
> adding polarization flags to drm_display_mode [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.drivers.driver-project.devel/47216
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (9):
>    drm/exynos: delay fbdev initialization until an output is connected
>    drm/exynos: init kms poll after creation of connectors
>    drm/exynos: correct timing porch conversion
>    exynos/fimd: add parallel output related bindings
>    drm/exynos: restore parallel output interface support
>    ARM: dts: exynos4210-universal: add exynos/fimd node
>    drm/modes: add polarization handling to mode conversion
>    drm/exynos/fimd: use polarization flags provided by drm_display_mode
>    drm/exynos/fimd: remove unused variable
>
>   .../devicetree/bindings/video/samsung-fimd.txt     |  15 +
>   arch/arm/boot/dts/exynos4210-universal_c210.dts    |  25 ++
>   drivers/gpu/drm/drm_modes.c                        |  11 +
>   drivers/gpu/drm/exynos/Kconfig                     |   8 +
>   drivers/gpu/drm/exynos/Makefile                    |   1 +
>   drivers/gpu/drm/exynos/exynos_drm_dpi.c            | 339 +++++++++++++++++++++
>   drivers/gpu/drm/exynos/exynos_drm_drv.c            |  22 +-
>   drivers/gpu/drm/exynos/exynos_drm_drv.h            |   8 +
>   drivers/gpu/drm/exynos/exynos_drm_fb.c             |   3 +
>   drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  32 +-
>   10 files changed, 432 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dpi.c
>

Including the V2 fixups sent for particular patches:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Will try to test on one of my boards with parallel displays soon.

Best regards,
Tomasz
