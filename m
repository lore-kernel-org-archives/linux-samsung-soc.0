From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 27 May 2014 08:28:52 +0200
Message-ID: <538430A4.8020702@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
 <20140526134153.GA2373@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140526134153.GA2373@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On 05/26/2014 03:41 PM, Thierry Reding wrote:
> On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
>> This patch adds DT bindings for s6e3fa0 panel.
>> The bindings describes panel resources, display timings and cpu mode timings.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> You're totally confusing me here. Half of this patch series is about
> adding i80 support to Exynos FIMD, and then you go and add what is
> apparently a DSI peripheral driver here that's supposed to be used by
> this new i80 support. Nothing I've been able to dig up indicates that
> i80 or DSI are in anyway related.

FIMD can produce parallel RGB output or command mode in i80 style output
via parallel lines.
DSIM can accept parallel RGB stream in this case it produces MIPI DSI
video mode signal or it can accept i80 and in this case it translates it
to MIPI DSI command mode.

Regards
Andrzej

>
> Even the Exynos DSI Master bindings[0] say that these two are not at all
> the same thing:
>
> 	port node:
> 	    - reg: (required) can be 0 for input RGB/I80 port or 1 for
> 	      DSI port;
>
> Am I missing something here?

>
> Thierry
>
> [0]: https://www.kernel.org/doc/Documentation/devicetree/bindings/video/exynos_dsim.txt
