From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0015/1529] Fix typo
Date: Mon, 23 May 2016 07:50:13 -0700
Message-ID: <574318A5.5000108@infradead.org>
References: <20160521113722.32053-1-andrea.gelmini@gelma.net>
 <20160523090301.3cdbd523@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20160523090301.3cdbd523@ipc1.ka-ro>
Sender: linux-pm-owner@vger.kernel.org
To: =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW@KARO-electronics.de>, Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, trivial@kernel.org, pawel.moll@arm.com, linux-pm@vger.kernel.org, devicetree@hellion.org.uk, cw00.choi@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, galak@codeaurora.org, dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/23/16 00:03, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> On Sat, 21 May 2016 13:37:22 +0200 Andrea Gelmini wrote:
>> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
>> ---
>>  Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt | 2=
 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/devfreq/event/exynos-=
ppmu.txt b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.=
txt
>> index 3e36c1d..616428a 100644
>> --- a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.tx=
t
>> +++ b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.tx=
t
>> @@ -8,7 +8,7 @@ use to analyze system performance, to make behaviors=
 visible and to count
>>  usages of each IP (DMC, CPU, RIGHTBUS, LEFTBUS, CAM interface, LCD,=
 G3D, MFC).
>>  The Exynos PPMU driver uses the devfreq-event class to provide even=
t data
>>  to various devfreq devices. The devfreq devices would use the event=
 data when
>> -derterming the current state of each IP.
>> +determing the current state of each IP.
>> =20
> s/determing/determine/

determining


--=20
~Randy
