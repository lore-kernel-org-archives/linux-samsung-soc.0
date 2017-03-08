From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 1/5] arm64: dts: exynos: Add the burst and esc clock
 frequency properties to DSI node
Date: Wed, 8 Mar 2017 09:12:02 +0200
Message-ID: <20170308071202.6fswc5v4bfwrckzz@kozik-lap>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308045502epcas1p2b16df118e0ad91dbd2446687dc5ee843@epcas1p2.samsung.com>
 <1488948852-5380-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488948852-5380-2-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, andi.shyti@samsung.com, a.hajda@samsung.com, airlied@linux.ie, catalin.marinas@arm.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, inki.dae@samsung.com, javier@osg.samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 08, 2017 at 01:54:08PM +0900, Hoegeun Kwon wrote:
> Add the burst and esc clock frequency properties to the parent (DSI node).
> Currently the clock is parsed from the port node, while it should be
> taken from the dsi node.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

If anyone needs this, then:


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-clock-dsi-property-4.12

for you to fetch changes up to e3c07546747cdec07ff15c984bc6cebc9c9f788c:

  arm64: dts: exynos: Add the burst and esc clock frequency properties to DSI node (2017-03-08 08:55:39 +0200)

----------------------------------------------------------------
Add the burst and esc clock frequency properties to DSI node in Exynos ARM64
DeviceTree, before the OF graph could be parsed.

----------------------------------------------------------------
Andi Shyti (2):
      arm64: dts: exynos: Enable ir-spi in the TM2 and TM2E boards
      arm64: dts: exynos: Add stmfts touchscreen node for TM2 and TM2E

Hoegeun Kwon (1):
      arm64: dts: exynos: Add the burst and esc clock frequency properties to DSI node

Hyungwon Hwang (1):
      arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 43 +++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 17 +++++++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     |  7 ++++
 3 files changed, 65 insertions(+), 2 deletions(-)
