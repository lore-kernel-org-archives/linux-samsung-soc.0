From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] pinctrl: dt-bindings: samsung: Add Exynos7 specific
 pinctrl macro definitions
Date: Wed, 18 Jan 2017 16:19:35 +0200
Message-ID: <20170118141935.eu7wmki7jnjdarkw@kozik-lap>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118054002epcas5p3b08e2f419976e17a3c584d64776810fd@epcas5p3.samsung.com>
 <1484718141-28785-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484718141-28785-3-git-send-email-pankaj.dubey@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, robh+dt@kernel.org, javier@osg.samsung.com, kgene@kernel.org, krzk@kernel.org, s.nawrocki@samsung.com, sanath@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 18, 2017 at 11:12:20AM +0530, Pankaj Dubey wrote:
> Exynos7 SoC pinctrl configurations are similar to existing Exynos4/5 except
> for FSYS1 pinctrl drive strengths. So adding Exynos7 specific FSYS1 blocks
> pinctrl driver strength related macros which will be used in Exynos7
> DTSi files.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  include/dt-bindings/pinctrl/samsung.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

I will need this header, so Sylwester if it is okay with you, could you
provide a tag with it (or ack it)?

Best regards,
Krzysztof
