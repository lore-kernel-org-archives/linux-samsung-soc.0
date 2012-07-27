From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCHv2 3/3] ARM: EXYNOS: Enable PMUs for exynos4/5
Date: Fri, 27 Jul 2012 10:02:02 +0100
Message-ID: <20120727090201.GD559@mudshark.cambridge.arm.com>
References: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
 <1343376509-5881-4-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1343376509-5881-4-git-send-email-chanho61.park@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 27, 2012 at 09:08:29AM +0100, Chanho Park wrote:
> This patch define irq numbers of ARM performance monitoring unit for exynos4/5.
> The number of CPU cores and PMU irq numbers are vary according to soc types.
> So we need to identify each soc type using soc_is_xxx function and define the
> pmu irqs dynamically. In case of exynos4412, there are 4 cpu cores and pmus.

We have devicetree bindings for the PMU -- why can't you use those instead
of probing the SoC all the time?

Will
