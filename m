From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/4] ARM: defconfig: exynos: Defconfig for v4.11
Date: Mon, 16 Jan 2017 22:41:37 -0800
Message-ID: <20170117064137.GO16607@localhost>
References: <20170113152030.13586-1-krzk@kernel.org>
 <20170113152030.13586-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113152030.13586-4-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 13, 2017 at 05:20:30PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.11
> 
> for you to fetch changes up to 74b0ee7579f279dae053053008d29f10f3890c07:
> 
>   ARM: exynos_defconfig: Enable IP multicast (2016-12-29 16:04:57 +0200)
> 
> ----------------------------------------------------------------
> Samsung defconfig update for v4.11:
> 1. Cleanup from old MACHs in s5pv210.
> 2. Enable IP_MULTICAST for libnss-mdns.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: s5pv210_defconfig: Remove old MACHs
> 
> Robie Basak (1):
>       ARM: exynos_defconfig: Enable IP multicast

Merged, thanks.


-Olof
