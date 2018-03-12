From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 7/7] ASoC: samsung: Add HDMI audio
 support for Chromebook Snow
Date: Mon, 12 Mar 2018 19:04:10 +0100
Message-ID: <20180312180410.ehbbrdu4gvkgx4zi@kozik-lap>
References: <CGME20180309175019epcas2p34a7fd706117cb18d31109dbc9c8cf60b@epcas2p3.samsung.com>
 <20180309174858.24017-1-s.nawrocki@samsung.com>
 <20180309174858.24017-7-s.nawrocki@samsung.com>
 <CAJKOXPddtARqmHAfYYp80pfnz8t_2ctT5bnf89bQw95LDUKQOw@mail.gmail.com>
 <a9f9a02c-128c-0414-cd90-6ecaf731cb8d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <a9f9a02c-128c-0414-cd90-6ecaf731cb8d@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, broonie@kernel.org, lgirdwood@gmail.com, javierm@redhat.com, robh+dt@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Mar 12, 2018 at 05:21:03PM +0100, Sylwester Nawrocki wrote:
> On 03/12/2018 08:39 AM, Krzysztof Kozlowski wrote:
> >> -#define FIN_PLL_RATE           24000000
> >> +#define FIN_PLL_RATE           24000000UL
> >
> > This change looks unrelated so how about making it separate patch?
> 
> I knew you will find this! ;P I don't want to be making this kind
> of funny patches :), I can repost v3 in a few days with this bit removed.

Ah, you know, after working with crappy code and crappy history, I find
very useful to have strict approach around changes.  This one might be
harmless... or you might be fixing some warning caught by your
compiler thus it looks like nice candidate for seaprate patch.

Best regards,
Krzysztof
