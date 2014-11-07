From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v5 5/5] regulator: of: Add support for parsing initial
 and suspend modes
Date: Fri, 07 Nov 2014 17:15:38 +0100
Message-ID: <545CF02A.9060500@collabora.co.uk>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk> <1415365205-27630-6-git-send-email-javier.martinez@collabora.co.uk> <20141107154743.GT8509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141107154743.GT8509-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11/07/2014 04:47 PM, Mark Brown wrote:
> On Fri, Nov 07, 2014 at 02:00:05PM +0100, Javier Martinez Canillas wrote:
> 
>> +	if (!of_property_read_u32(np, "regulator-initial-mode", &pval)) {
>> +		if (desc && desc->map_modes)
>> +			constraints->initial_mode = desc->map_modes(pval);
>> +		else
>> +			pr_warn("%s: failed to parse regulator-initial-mode\n",
>> +				np->name);
>> +	}
> 
> This is ignoring any error return from map_modes(), it's possible the DT
> might have an invalid value.  The error message could also use some
> improvement, it's more that the kernel doesn't understand how to parse
> it even if it is valid.
> 

Right, as I mentioned to Krzysztof in a previous email, I'll remove the
warning message and add an error message instead if the map mode callback
function fails and also show the error code as you suggest.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
