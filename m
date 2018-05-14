From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [FAIL bisect] Sound card probe error
Date: Mon, 14 May 2018 14:40:35 +0200
Message-ID: <4c61c422-a036-8fec-1153-d612fe5df878@samsung.com>
References: <CGME20180514101728epcas4p3108760546a415b36252df93dfe38e0fb@epcas4p3.samsung.com>
        <CAJKOXPfD8gZR8nZkmAr=Ldt3xESuFocQLnMtrDsNZu=ba55jcw@mail.gmail.com>
        <b193b8a0-ad25-1895-8f8d-ffab97261dc1@samsung.com>
        <CAJKOXPc+kLA+BPBmaP14zMLbbxxCmWF1eZnKoa_PcO2z9jG9JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPc+kLA+BPBmaP14zMLbbxxCmWF1eZnKoa_PcO2z9jG9JQ@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Inki Dae <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/14/2018 02:29 PM, Krzysztof Kozlowski wrote:
> Ah, I missed these messages because I was looking at err dmesg level
> (and for some reason these are warn). Anyway do you have any thoughts
> how is it connected with missing Odroid XU3 sound card and max98090
> codec?

One reason is that the DRM driver registers an ASoC codec object which
is required for the sound card registration to complete. But I wonder
why there is no any error messages related to this.

-- 
Regards,
Sylwester
