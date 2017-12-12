From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: mainline/master boot bisection: v4.15-rc3 on peach-pi #3228-staging
Date: Tue, 12 Dec 2017 11:10:43 +0100
Message-ID: <CAJKOXPfZUCj8krUXuCi0pqD6v4OJD0-yySoz0hLW0Dsqis95+Q@mail.gmail.com>
References: <680389204.71.1512980755810.JavaMail.jenkins@ip-172-30-0-246>
 <51e6d7fb-ac9e-a59f-ea63-ad06219b429d@collabora.com> <CAKMK7uFcGftSeQjkKu9SZmkQd8-irbUTMcOnUwi7HZtb5TePag@mail.gmail.com>
 <CABxcv=mUHgTxvYpOYstE7rQn8fKS3QGiTT=FzBUc8DREvVuTeQ@mail.gmail.com>
 <CABxcv=m-fYZvYN4gLwBf8NwHvJb7PtNdVKR+SXgVKExZGtW4Qw@mail.gmail.com>
 <20171211225829.GA1959@n2100.armlinux.org.uk> <20171211230213.GB1959@n2100.armlinux.org.uk>
 <CGME20171211232533epcas1p1821f8808ca6da7bd28c57fb4121d36fa@epcas1p1.samsung.com>
 <2df0fc74-8b79-5cca-7a8a-9e005b44d8d8@osg.samsung.com> <2139f436-5646-7f9f-a6cb-285a0fd31969@samsung.com>
 <CABxcv=n9PvoYr1xwB8CHBmE00XaTUqT642g7F8nuZd-d031h5Q@mail.gmail.com> <88bebc9d-a889-403b-a742-c11ad6617638@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751542AbdLLKKq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 05:10:46 -0500
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com [209.85.128.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 422FD218D8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2017 10:10:45 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z18so20511117wrb.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2017 02:10:45 -0800 (PST)
In-Reply-To: <88bebc9d-a889-403b-a742-c11ad6617638@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Shuah Khan <shuahkh@osg.samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-build-reports@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Escande <thierry.escande@collabora.co.uk>, Kevin Hilman <khilman@baylibre.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Dec 12, 2017 at 9:47 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Javier,
>
> On 2017-12-12 09:00, Javier Martinez Canillas wrote:
>>
>> On Tue, Dec 12, 2017 at 8:54 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:

(...)

>>> This warning has been added intentionally, see following discussions:
>>> https://patchwork.kernel.org/patch/10034919/
>>> https://patchwork.kernel.org/patch/10070475/
>>>
>>> This means that your test apps should be updated or you should enable
>>> Exynos
>>> IOMMU support in your config. Maybe it is a good time to finally enable
>>> it
>>> in exynos_defconfig.
>>>
>> Has the issue that the boot-loader keeps the display controller
>> enabled and scanning pages on the Exynos Chromebooks resolved?
>>
>> I think that's that preventing to enable it by default in
>> exynos_defconfig since it caused boot failures when enabled on these
>> machines. I don't follow exynos development too closely nowadays so
>> maybe there's a fix in place now.
>
>
> Not directly. I still didn't find time to properly add support for
> devices, which were left in-working state (with active DMA
> transactions) by bootloader, but due to some other changes in the
> order of operations during boot process, power domains are
> initialized very early and due to temporary lack of devices (which
> are not yet added to the system), are turned off. This practically
> stops FIMD for scanning framebuffer and "solves" this issue.
>
> I've checked now and Exynos Snow Chromebook boots fine with IOMMU
> support enabled, both with v4.15-rc3 and linux-next.

Then it looks like we could give EXYNOS_IOMMU a try. At least only on
exynos_defconfig which would leave multi_v7 as a platform to compare.

Best regards,
Krzysztof
