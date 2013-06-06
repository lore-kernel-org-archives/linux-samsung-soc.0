From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Thu, 6 Jun 2013 18:12:17 +0200
Message-ID: <201306061812.18138.arnd@arndb.de>
References: <0a1201ce6268$d5a51610$80ef4230$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0a1201ce6268$d5a51610$80ef4230$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 06 June 2013, Kukjin Kim wrote:
> As we discussed in mailing list, non-DT for EXYNOS SoCs will not be
> supported from v3.11. This patch removes regarding files for non-DT
> including board files and defconfig.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> 
> It's time to remove non-DT stuff for EXYNOS SoCs.
> If no objection on this, this will be sent to arm-soc in a couple of days.

Please do. I think there are no excuses left this time ;-)

However, I wonder if more code in arch/arm/plat-samsung can be made to
depend on the presence of ATAGS. I suspect there a lot of files that
we no longer need to build for an Exynos kernel now.

	Arnd
