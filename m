From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 2/7] arm: dts: Add the burst and esc clock frequency
 properties for exynos3250 dts
Date: Fri, 03 Mar 2017 09:26:07 +0900
Message-ID: <20170303002607.fdw6ipqzzvo6j5wh@gangnam.samsung>
References: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170302102113epcas1p343e9da20f05be0a2359bf32834626c4a@epcas1p3.samsung.com>
 <1488450019-6482-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-disposition: inline
In-reply-to: <1488450019-6482-3-git-send-email-hoegeun.kwon@samsung.com>
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

On Thu, Mar 02, 2017 at 07:20:14PM +0900, Hoegeun Kwon wrote:
> The OF graph is not needed because the panel is a child of dsi. So
> added the burst and esc clock frequency properties to the parent (DSI
> node), taking into account the bisectability problem so that remove
> the OF graph from DSI node.

nitpick:

1. bisectability is not a problem (and for bisectability you
   should not mention it in the commit log, you would confuse
   bisecting people)

2. you should use the imperative form, not "added the burst... "
   but "add the burst..."

Same for the other patches.

Andi
