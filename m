From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] dt-bindings: samsung: Document bindings for Samsung
 aries boards
Date: Fri, 22 Jun 2018 09:57:16 +0200
Message-ID: <CAJKOXPe-Ty6OdHwGGMvrxmRkfBPzkicFZxWHTy=zzMiZZMFBeg@mail.gmail.com>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1529608199-5583-6-git-send-email-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPdV+UKKnntcrXQ15aOB5eCehyxqVEJfvZp5faTw434rPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdV+UKKnntcrXQ15aOB5eCehyxqVEJfvZp5faTw434rPw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On 22 June 2018 at 09:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21 June 2018 at 21:09, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.c=
om> wrote:
>> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>

... and commit msg please.

BR,
Krzysztof

>> ---
>>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-board=
s.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> index 14510b215480..edce6602de50 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> @@ -2,6 +2,8 @@
>>
>>  Required root node properties:
>>      - compatible =3D should be one or more of the following.
>> +       - "samsung,aries"       - for S5PV210-based Samsung Aries board.
>> +       - "samsung,galaxys"     - for S5PV210-based Samsung Galaxy S (i9=
000)  board.
>
> It is not strictly speaking Exynos-based board (as mentioned in the
> header at beginning of file) so maybe change it to "Samsung's Exynos
> and S5P SoC based boards"?
>
> Best regards,
> Krzysztof
>
>>         - "samsung,artik5"      - for Exynos3250-based Samsung ARTIK5 mo=
dule.
>>         - "samsung,artik5-eval" - for Exynos3250-based Samsung ARTIK5 ev=
al board.
>>         - "samsung,monk"        - for Exynos3250-based Samsung Simband b=
oard.
>> --
>> 2.7.4
>>
