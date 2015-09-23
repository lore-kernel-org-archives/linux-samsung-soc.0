From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] Documentation: bindings: mfd: cros ec: document
 vbc EC property
Date: Wed, 23 Sep 2015 11:31:22 -0300
Message-ID: <5602B7BA.8020302@collabora.co.uk>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
 <20150923003401.GB16510@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150923003401.GB16510@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Lee,

On 22/09/15 21:34, Lee Jones wrote:
> On Mon, 21 Sep 2015, Emilio L=C3=B3pez wrote:
>
>> Some EC implementations include a small nvram space used to store
>> verified boot context data. This boolean property lets us indicate
>> whether this space is available or not on a specific EC implementati=
on.
>>
>> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> ---
>>
>> Patch is new in v3, split from 3/4
>>
>>   Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Doc=
umentation/devicetree/bindings/mfd/cros-ec.txt
>> index 1777916..136e0c2 100644
>> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
>> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
>> @@ -34,6 +34,10 @@ Required properties (LPC):
>>   - compatible: "google,cros-ec-lpc"
>>   - reg: List of (IO address, size) pairs defining the interface use=
s
>>
>> +Optional properties (all):
>> +- google,has-vbc-nvram: Some implementations of the EC include a sm=
all
>> +  nvram space used to store verified boot context data. This boolea=
n flag
>> +  is used to specify whether this nvram is present or not.
>
> Is there no way to check for this at runtime?

You can issue a read and see if it succeeds, but the problem is that=20
some EC implementations return success even when they don't implement=20
the functionality.

Cheers,

Emilio
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
