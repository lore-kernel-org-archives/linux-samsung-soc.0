From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 3/3] arm64: dts: exynos: Add support for S6E3HA2
 panel device on TM2 board
Date: Tue, 7 Mar 2017 22:17:46 +0200
Message-ID: <20170307201746.brpn4h2atvueg3l5@kozik-lap>
References: <1487574582-15746-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170220071001epcas1p3c2b32665942ba55c3ed4e06d2c66d661@epcas1p3.samsung.com>
 <5be15c1c-ba4c-94d9-30be-8d161e9be7b3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5be15c1c-ba4c-94d9-30be-8d161e9be7b3@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, andi.shyti@samsung.com, a.hajda@samsung.com, airlied@linux.ie, catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jh80.chung@samsung.com, inki.dae@samsung.com, javier@osg.samsung.com, thierry.reding@gmail.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 22, 2017 at 10:09:54AM +0900, Hoegeun Kwon wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
> 
> This patch add the panel device tree node for S6E3HA2 display
> controller to TM2 dts.
> 
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I tried to apply but:
fatal: corrupt patch at line 37
Patch failed at 0001 arm64: dts: exynos: Add support for S6E3HA2 panel
device on TM2 board

Please fix, rebase, add blank link as suggested by Javier and send a
v11.

Best regards,
Krzysztof
