From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 2/2] ASoC: samsung: Add HDMI audio
	support for Snow
Date: Mon, 12 Mar 2018 19:54:20 +0100
Message-ID: <06ddf7cf-02dc-f50c-37bb-157f4d643c07@samsung.com>
References: <20180312184939.11327-1-s.nawrocki@samsung.com>
 <CGME20180312185000epcas1p2ae13436139bee76311206ac3fd74267c@epcas1p2.samsung.com>
 <20180312184939.11327-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180312184939.11327-2-s.nawrocki@samsung.com>
Content-language: en-GB
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 03/12/2018 07:49 PM, Sylwester Nawrocki wrote:
> This patch updates the driver so, in addition to current DT bindings, it
> also can also use the new DT bindings with cpu, codec subnodes which allow
> to support sound on the HDMI interface.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I've forgotten to add Krzysztof's tag:

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
