From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: configure TV path clocks for
 Ultra HD modes
Date: Mon, 23 Jan 2017 18:35:12 +0200
Message-ID: <20170123163512.elwiyjwlwardgmgu@kozik-lap>
References: <a9812091-2b97-0abf-da74-313ff941bb76@samsung.com>
 <CGME20170123100557eucas1p28174748d64c4e8503a2006a9c5b554a6@eucas1p2.samsung.com>
 <1485165949-32661-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485165949-32661-1-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 23, 2017 at 11:05:49AM +0100, Andrzej Hajda wrote:
> Ultra HD modes requires clock ticking at increased rate.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> v2: long lines wrapped
> v3: moved assigned clocks to cmu_disp node in tm2-common
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
