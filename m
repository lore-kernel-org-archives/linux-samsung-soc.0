From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/3] ARM: drivers: memory: SROM controller for v4.7
Date: Thu, 28 Apr 2016 18:07:28 +0200
Message-ID: <4542406.lBvA1xgIVV@wuerfel>
References: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com>
 <1461748256-4394-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461748256-4394-4-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 27 April 2016 11:10:56 Krzysztof Kozlowski wrote:
> Finally, I hope the SROM controller can be split from mach-exynos into
> drivers/memory. This is a very long standing patchset. The delay was
> caused (twice) by very late comments, including comments for already
> acked patch by the acker. Endless work... but I think entire feedback
> was addressed (not ignored!).
> 
> This includes internal dependency: samsung-dt-exynos-srom-fixup-4.7.
> 
> Please, be so kind and pick it up.
> 

Pulled into next/drivers, thanks!

	Arnd
