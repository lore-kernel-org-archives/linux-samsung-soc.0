From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM64: EXYNOS: defconfig for 4.6
Date: Wed, 02 Mar 2016 23:16:33 +0100
Message-ID: <22810452.N8NmEBjiMM@wuerfel>
References: <1456825042-23733-1-git-send-email-k.kozlowski@samsung.com>
 <1456825042-23733-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456825042-23733-2-git-send-email-k.kozlowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 01 March 2016 18:37:21 Krzysztof Kozlowski wrote:
> ARM64 defconfig changes for Exynos based boards for v4.6:
> 1. We want thermal for Exynos7 TMU unit to monitor the temperature.
> 2. Enable the drivers for PMIC used on Exynos7-based Espresso board.
> 

Pulled into next/arm64, thanks!

	Arnd
