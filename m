From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: exynos: Enable drivers for Exynos5433
Date: Tue, 21 Mar 2017 19:18:00 +0200
Message-ID: <20170321171800.6kn5efw425np4h7h@kozik-lap>
References: <20170314171028.20337-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170314171028.20337-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 14, 2017 at 07:10:25PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> Patches are independent but I organized them into one patchset
> as they have common goal - enable more drivers for ARMv8 Exynos chips.
> 
> If there are no objections, I can take it through samsung-soc.
> 
> Changes since v1:
> ================
> 1. Patch 1/3: Do not enable entire DRM stack but only drivers
>    supporting Exynos5433 and Exynos7 (suggested by Bartlomiej).
> 2. Add Bartlomiej's and Alim's reviews.
> 
> 
> Best regards,
> Krzysztof
>

I appled all three to samsung-soc and I will push them through arm-soc.

Best regards,
Krzysztof
