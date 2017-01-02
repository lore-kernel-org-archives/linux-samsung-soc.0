From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos5433: Add support of bus
 frequency using VDD_INT on TM2
Date: Mon, 2 Jan 2017 20:37:11 +0200
Message-ID: <20170102183711.jl2tznpaxgwakwhc@kozik-lap>
References: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
 <1481173091-9728-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1481173091-9728-6-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, krzk@kernel.org, s.nawrocki@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 08, 2016 at 01:58:11PM +0900, Chanwoo Choi wrote:
> This patch adds the bus Device-tree nodes for INT (Internal) block
> to enable the bus frequency scaling.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 70 +++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
Thanks, applied.

Best regards,
Krzysztof
