From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] phy: Select PHY_EXYNOS_DP_VIDEO by default for
 ARCH_EXYNOS
Date: Fri, 21 Feb 2014 17:41:35 +0100
Message-ID: <1888663.ccFYmJ9QJl@wuerfel>
References: <1392997802-29050-1-git-send-email-s.nawrocki@samsung.com>
 <1753680.KKj0Q1erxA@wuerfel> <53077DE0.7080108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53077DE0.7080108@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kishon@ti.com
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 February 2014 17:25:04 Sylwester Nawrocki wrote:
> 
> Hmm, good point, I will modify it that way.
> 
> For patch 1/2 I guess it should be:
> 
> "default ARCH_S5PV210 || ARCH_EXYNOS"
> 
> or rather
> 
> "default y if ARCH_S5PV210 || ARCH_EXYNOS" ?

Right. I'd probably use the first syntax, but it doesn't really matter.

	Arnd
