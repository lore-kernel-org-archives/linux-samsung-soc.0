From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: pl330: report BURST residue granularity
Date: Thu, 28 Jun 2018 11:24:28 +0530
Message-ID: <20180628055428.GM22377@vkoul-mobl>
References: <CGME20180619132105eucas1p2d65cbd799e60a8ab1849c4ae716275c4@eucas1p2.samsung.com>
 <20180619132105eucas1p2d65cbd799e60a8ab1849c4ae716275c4~5klprrrtK1347113471eucas1p2M@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619132105eucas1p2d65cbd799e60a8ab1849c4ae716275c4~5klprrrtK1347113471eucas1p2M@eucas1p2.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Vinod Koul <vinod.koul@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 19-06-18, 15:20, Marek Szyprowski wrote:
> The reported residue is already calculated in BURST unit granularity, so
> advertise this capability properly to other devices in the system.

Applied, thanks

-- 
~Vinod
