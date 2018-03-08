From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 6/6] ASoC: samsung: Add HDMI audio support
 for Chromebook Snow
Date: Thu, 08 Mar 2018 12:52:31 +0100
Message-ID: <fe2fe1cd-b1a7-9f16-5c68-110c0f375dca@samsung.com>
References: <CGME20180307170502epcas1p187b4623a868daa6045465836903e591f@epcas1p1.samsung.com>
 <20180307170450.14182-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180307170450.14182-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 03/07/2018 06:04 PM, Sylwester Nawrocki wrote:
> +	/* In the multi-codec case codec_dai 0 is HDMI and 1 is MAX98095. */

Oops, it should be the other way around, now it contradicts the DT binding
documentation. I'm going to post v2.

> +	if (rtd->num_codecs > 1)
> +		codec_dai = rtd->codec_dais[1];
> +	else
> +		codec_dai = rtd->codec_dai;
