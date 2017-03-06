From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v4 3/5] drm/exynos: dsi: Fix the parse_dt function
Date: Mon, 06 Mar 2017 13:49:52 +0900
Message-ID: <20170306044952.qi32osytl4ynoooy@gangnam.samsung>
References: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170306044236epcas5p326440b0139bee5a33fd6545d0400bb57@epcas5p3.samsung.com>
 <1488775343-6236-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-disposition: inline
In-reply-to: <1488775343-6236-4-git-send-email-hoegeun.kwon@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, javier@osg.samsung.com, airlied@linux.ie, catalin.marinas@arm.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, inki.dae@samsung.com, robh+dt@kernel.org, kgene@kernel.org, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Hoegeun,

On Mon, Mar 06, 2017 at 01:42:21PM +0900, Hoegeun Kwon wrote:
> The dsi + panel is a parental relationship, so OF grpah is not needed.
> Therefore, the current dsi_parse_dt function will throw an error,
> because there is no linked OF graph for case such as fimd + dsi +
> panel. So this patch parse the Pll, burst and esc clock frequency
> properties in dsi_parse_dt and modified to create a bridge_node only
> if there is an OF graph associated with dsi.
> So I think the ABI breakage is needed.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Andi
