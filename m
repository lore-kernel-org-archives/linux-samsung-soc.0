From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v4 1/5] arm64: dts: exynos: Add the burst and esc clock
 frequency properties to DSI node
Date: Mon, 06 Mar 2017 13:49:12 +0900
Message-ID: <20170306044912.b7syhwilwxygpjlj@gangnam.samsung>
References: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170306044233epcas1p20b5e6c764a7752290e5ed25cc13a69af@epcas1p2.samsung.com>
 <1488775343-6236-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-disposition: inline
In-reply-to: <1488775343-6236-2-git-send-email-hoegeun.kwon@samsung.com>
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

On Mon, Mar 06, 2017 at 01:42:19PM +0900, Hoegeun Kwon wrote:
> The OF graph is not needed because the panel is a child of dsi. Add
> the burst and esc clock frequency properties to the parent (DSI node).
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

you forgot to put me in Cc and add my

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Andi
