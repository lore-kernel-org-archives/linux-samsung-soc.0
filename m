From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Fri, 06 Mar 2015 16:07:08 +0100
Message-ID: <54F9C29C.7050608@collabora.co.uk>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk> <7hioehu8cn.fsf@linaro.org> <54F6C746.606@samsung.com> <54F6DD79.9070009@collabora.co.uk> <54F9AC76.1000305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F9AC76.1000305@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Inki,

On 03/06/2015 02:32 PM, Inki Dae wrote:
>> 
>> Another interesting data point is that the error in next-20150303 for
>> these 2 boards was the NULL pointer dereference in exynos_plane_destroy
>> that I got with 4.0-rc2 (when IOMMU is disabled) in Snow and Peach Pit.
> 
> I think the NULL pointer dereference issue may be fixed with below patch
> I merged to exynos-drm-fixes just a while ago,
> https://lkml.org/lkml/2015/2/17/434
> 
> Could you test it with this patch again?
>

Thanks, I tested v4.0-rc2 + the patch to disable IOMMU + the patch you
mentioned and the crash does not happen anymore in Peach Pit and Snow.

>> 
>> Another thing that may be useful to detect these issues early is to have
>> exynos-drm-next be pulled by linux-next since otherwise the integration
>> is not tested until the changes are picked by the DRM maintainer.
>> 

I know that I may sound like a broken record but could you please make
sure that your tree is included in linux-next?

That way the fix could be tested by all the machines that are testing
linux-next daily since right now Exynos will still be broken until you
send a pull request to the DRM maintainer.

So it would be nice to get the changes as soon as possible into -next
to avoid a recurrent error to mask other possible new issues.

Best regards,
Javier
