From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 00/12] media: Exynos GScaller driver fixes
Date: Wed, 9 Nov 2016 14:21:24 -0300
Message-ID: <517f0587-6df0-9a35-44f6-55087e1717a7@osg.samsung.com>
References: <CGME20161109142406eucas1p2c3c158d10fd96d97c57a32ab402acd2e@eucas1p2.samsung.com>
 <1478701441-29107-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1478701441-29107-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 11/09/2016 11:23 AM, Marek Szyprowski wrote:
> Hi!
> 
> This is a collection of various fixes and cleanups for Exynos GScaller
> media driver. Most of them comes from the forgotten patchset posted long
> time ago by Ulf Hansson:
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg80592.html
> 
> While testing and rebasing them, I added some more cleanups. Tested on
> Exynos5422-based Odroid XU3 board.
> 

I've tested this series on a Exynos5800-based Peach Pi Chromebook. The
patches were tested on top of Sylwester's for-v4.10/media/next branch:

git://linuxtv.org/snawrocki/samsung.git for-v4.10/media/next

So feel free to add for the whole series:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
