From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] phy: Select PHY_EXYNOS_DP_VIDEO by default for
 ARCH_EXYNOS
Date: Fri, 21 Feb 2014 18:54:07 +0100
Message-ID: <1413607.hGO0bhiXpo@wuerfel>
References: <1392997802-29050-1-git-send-email-s.nawrocki@samsung.com>
 <1888663.ccFYmJ9QJl@wuerfel> <530783E4.6090206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <530783E4.6090206@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, kishon@ti.com
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 February 2014 17:50:44 Sylwester Nawrocki wrote:
> On 21/02/14 17:41, Arnd Bergmann wrote:
> > On Friday 21 February 2014 17:25:04 Sylwester Nawrocki wrote:
> >> > 
> >> > Hmm, good point, I will modify it that way.
> >> > 
> >> > For patch 1/2 I guess it should be:
> >> > 
> >> > "default ARCH_S5PV210 || ARCH_EXYNOS"
> >> > 
> >> > or rather
> >> > 
> >> > "default y if ARCH_S5PV210 || ARCH_EXYNOS" ?
> >
> > Right. I'd probably use the first syntax, but it doesn't really matter.
> 
> Oops, I've already sent patch using the second one, as it seemed
> more common.

As I said, it doesn't matter.

	Arnd
