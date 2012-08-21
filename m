From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] mmc: dt: Add 'broken-cd' DT binding
Date: Tue, 21 Aug 2012 09:21:47 -0500
Message-ID: <5033997B.9010605@gmail.com>
References: <1345547371-6784-1-git-send-email-thomas.abraham@linaro.org> <CAJuYYwSv+dum8RP9xy+AZCH9pTU0peDpwjt7TA5zn3MFsG1uWA@mail.gmail.com> <87k3ws5uhs.fsf@octavius.laptop.org> <201208211208.49987.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <201208211208.49987.arnd@arndb.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/21/2012 07:08 AM, Arnd Bergmann wrote:
> On Tuesday 21 August 2012, Chris Ball wrote:
>> How about this?
>>
>> broken-cd: No CD available, use polling.
>>
>> cd-gpios: The CD pin on the host is working and brought out to a GPIO.
>>
>> external-cd-gpios: The CD pin on the host is broken, but there's an
>>                    independent external GPIO available.
>>
>>
>> (Each host should only have one of these properties.)
> 
> The fsl-imx-esdhc.txt binding already has all three cases, but
> describes them differently:
> 
> fsl,cd-internal: when present, the CD pin on the host is working
> cd-gpios: when present, contains the gpio line that CD is connected to
> If both are absent, it has to use polling.

This makes the most sense to me. However, I prefer broken-cd over
cd-internal. The binding should add properties for exceptions, not SDHCI
spec compliant implementations.

Rob
