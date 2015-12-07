From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01 bindings
Date: Mon, 07 Dec 2015 10:05:23 +0900
Message-ID: <5664DB53.6030801@samsung.com>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
 <20151204155509.GA27455@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20151204155509.GA27455@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05.12.2015 00:55, Rob Herring wrote:
> On Fri, Dec 04, 2015 at 10:10:05AM +0900, Krzysztof Kozlowski wrote:
>> The mfd/s2mpa01.txt duplicates some of the information about bindings
>> with old mfd/s2mps11.txt. Now common part exists entirely in
>> mfd/samsung,sec-core.txt so:
>>  - add company prefix to file name (regulator/samsung,s2mpa01.txt),
>>  - remove duplicated information,
>>  - reorganize the contents to match style of
>>    regulator/samsung,s2mps11.txt.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Next time, use git format-patch -M option.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

It is already used but I also changed the style and formatting to the
similarity dropped below default level of 50%. I could of course first
rename and then change formatting/contents but that would be a little
bit too much for this simple patchset, don't you think?

Anyway thanks for acks!

Best regards,
Krzysztof

