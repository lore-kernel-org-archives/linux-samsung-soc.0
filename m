From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [FAIL bisect] Sound card probe error
Date: Mon, 14 May 2018 14:45:19 +0200
Message-ID: <CAJKOXPc6Yj0+Z6zd-Gm-fYvfQB4rPPn0k6ED8bWScJ-tdZ=Ysw@mail.gmail.com>
References: <CGME20180514101728epcas4p3108760546a415b36252df93dfe38e0fb@epcas4p3.samsung.com>
 <CAJKOXPfD8gZR8nZkmAr=Ldt3xESuFocQLnMtrDsNZu=ba55jcw@mail.gmail.com>
 <b193b8a0-ad25-1895-8f8d-ffab97261dc1@samsung.com> <CAJKOXPc+kLA+BPBmaP14zMLbbxxCmWF1eZnKoa_PcO2z9jG9JQ@mail.gmail.com>
 <4c61c422-a036-8fec-1153-d612fe5df878@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4c61c422-a036-8fec-1153-d612fe5df878@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Inki Dae <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 14, 2018 at 2:40 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 05/14/2018 02:29 PM, Krzysztof Kozlowski wrote:
>> Ah, I missed these messages because I was looking at err dmesg level
>> (and for some reason these are warn). Anyway do you have any thoughts
>> how is it connected with missing Odroid XU3 sound card and max98090
>> codec?
>
> One reason is that the DRM driver registers an ASoC codec object which
> is required for the sound card registration to complete. But I wonder
> why there is no any error messages related to this.

Thanks Marek and Sylwester. Another point is that probably OOPS later
should not happen...

Best regards,
Krzysztof
