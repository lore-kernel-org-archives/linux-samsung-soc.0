From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC 4/5] regulator: tps65090: Set voltage for fixed regulators
Date: Wed, 30 Jul 2014 10:55:59 +0200
Message-ID: <53D8B31F.6040404@collabora.co.uk>
References: <1406651339-28901-1-git-send-email-javier.martinez@collabora.co.uk> <1406651339-28901-5-git-send-email-javier.martinez@collabora.co.uk> <20140729173631.GX17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140729173631.GX17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/29/2014 07:36 PM, Mark Brown wrote:
> On Tue, Jul 29, 2014 at 06:28:58PM +0200, Javier Martinez Canillas wrote:
> 
>> +#define tps65090_REG_VAR(_id, _sname, en_reg, _en_bits, _ops) \
>> +	tps65090_REG_DESC(_id, _sname, en_reg, _en_bits, 0, 0, _ops)
> 
> I'd expect this to describe a variable regulator when in fact it
> seems it describes a switch with no regulation.  Better name please.
> 

Yes, when writing the patch I thought of a switch as a non-fixed regulator whose
output voltage is variable and depend on its input supply voltage. That's why I
used VAR but I agree that is a bad name and I'll change it.

Thanks a lot and best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
