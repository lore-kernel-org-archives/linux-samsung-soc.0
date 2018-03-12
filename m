From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 7/7] ASoC: samsung: Add HDMI audio
 support for Chromebook Snow
Date: Mon, 12 Mar 2018 17:21:03 +0100
Message-ID: <a9f9a02c-128c-0414-cd90-6ecaf731cb8d@samsung.com>
References: <CGME20180309175019epcas2p34a7fd706117cb18d31109dbc9c8cf60b@epcas2p3.samsung.com>
 <20180309174858.24017-1-s.nawrocki@samsung.com>
 <20180309174858.24017-7-s.nawrocki@samsung.com>
 <CAJKOXPddtARqmHAfYYp80pfnz8t_2ctT5bnf89bQw95LDUKQOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <CAJKOXPddtARqmHAfYYp80pfnz8t_2ctT5bnf89bQw95LDUKQOw@mail.gmail.com>
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, broonie@kernel.org, lgirdwood@gmail.com, javierm@redhat.com, robh+dt@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/12/2018 08:39 AM, Krzysztof Kozlowski wrote:
>> -#define FIN_PLL_RATE           24000000
>> +#define FIN_PLL_RATE           24000000UL
>
> This change looks unrelated so how about making it separate patch?

I knew you will find this! ;P I don't want to be making this kind
of funny patches :), I can repost v3 in a few days with this bit removed.

-- 
Regards,
Sylwester
