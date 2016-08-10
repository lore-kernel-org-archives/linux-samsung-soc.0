From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] exynos-drm: Fix display manager failing to start without
 IOMMU problem
Date: Wed, 10 Aug 2016 17:05:02 -0600
Message-ID: <57ABB31E.1070802@osg.samsung.com>
References: <CGME20160810214111epcas1p4dd2a581353b550a1992fc7695e846da7@epcas1p4.samsung.com>
 <1470850251-9150-1-git-send-email-shuahkh@osg.samsung.com>
 <57ABB1ED.1080301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57ABB1ED.1080301@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/10/2016 04:59 PM, Inki Dae wrote:
> Hi Shuah,
> 
> 2016년 08월 11일 02:30에 Shuah Khan 이(가) 쓴 글:
>> Fix exynos_drm_gem_create_ioctl() attempts to allocate non-contiguous GEM
>> memory without IOMMU. In this case, there is no point in attempting to
> 
> DRM gem can be used for Non-DRM drivers such as GPU, V4L2 based Multimedia device and other DMA devices.
> Even though IOMMU support is disabled, other framework based DMA drivers can use IOMMU - i.e., GPU driver -
> and they can use non-contiguous GEM buffer through UMM. (DMABUF) 
> 
> So GEM allocation type is not dependent on IOMMU.

Hi Inki,

I am seeing the following failure without IOMMU and light dm fails
to start:

[drm:exynos_drm_framebuffer_init] *ERROR* Non-continguous GEM memory is not supported.

The change I made fixed that problem and light dm starts without IOMMU.
Is there a better way to fix this problem? Currently without IOMMU,
light dm doesn't start.

This is on linux_next

thanks,
-- Shuah
