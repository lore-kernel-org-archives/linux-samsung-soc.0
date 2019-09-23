From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn clock gating
Date: Mon, 23 Sep 2019 11:13:09 +0200
Message-ID: <91b0fc41-61e6-4650-2991-313dda4b494a@samsung.com>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
 <20190920130218.32690-5-s.nawrocki@samsung.com>
 <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 9/23/19 10:51, Charles Keepax wrote:
> On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
>> As an intermediate step before covering the clocking subsystem
>> of the CODEC entirely by the clk API add handling of external CODEC's
>> master clocks in DAPM events when the AIFn clocks are sourced directly
>> from MCLKn; when FLLn are used we enable/disable respective MCLKn
>> before/after FLLn is enabled/disabled.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Looks good to me:
> 
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks a lot for reviewing!
